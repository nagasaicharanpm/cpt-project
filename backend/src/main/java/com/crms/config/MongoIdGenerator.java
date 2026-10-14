package com.crms.config;

import org.bson.Document;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.FindAndModifyOptions;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapping.event.BeforeConvertCallback;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.stereotype.Component;

/** Keeps the existing numeric API identifiers while storing documents in MongoDB. */
@Component
public class MongoIdGenerator implements BeforeConvertCallback<Object> {
    private final ObjectProvider<MongoTemplate> mongo;

    public MongoIdGenerator(ObjectProvider<MongoTemplate> mongo) {
        this.mongo = mongo;
    }

    @Override
    public Object onBeforeConvert(Object entity, String collection) {
        try {
            var idField = entity.getClass().getDeclaredField("id");
            if (!idField.isAnnotationPresent(Id.class)) return entity;
            var getId = entity.getClass().getMethod("getId");
            if (getId.invoke(entity) != null) return entity;
            var counter = mongo.getObject().findAndModify(
                    Query.query(Criteria.where("_id").is(collection)),
                    new Update().inc("value", 1),
                    FindAndModifyOptions.options().returnNew(true).upsert(true),
                    Document.class,
                    "counters");
            entity.getClass().getMethod("setId", Long.class).invoke(entity, counter.get("value", Number.class).longValue());
        } catch (NoSuchFieldException ignored) {
            // Nested value object; it is not a root Mongo document.
        } catch (ReflectiveOperationException ex) {
            throw new IllegalStateException("Could not assign a MongoDB id", ex);
        }
        return entity;
    }
}
