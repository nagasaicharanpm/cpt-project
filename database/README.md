# Database setup

The current backend uses MongoDB, not MySQL or JPA.

1. Start MongoDB on `mongodb://127.0.0.1:27017`.
2. Set `MONGODB_URI` and `MONGODB_DATABASE` in `backend/.env` if you are not using the local defaults.
3. Start the API. MongoDB collections and indexes are created automatically by Spring Data.

The `schema.sql` file is retained as a legacy reference from the earlier MySQL version and is not used by the current application.
