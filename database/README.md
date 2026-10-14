# Database setup

1. Install MySQL 8 and run `schema.sql` as an administrator.
2. Set `DB_URL`, `DB_USERNAME`, and `DB_PASSWORD` in `backend/.env` or the process environment.
3. Start the API once; Hibernate creates the tables from the entity relationships.
4. For production, use a migration tool and set `spring.jpa.hibernate.ddl-auto=validate`.
