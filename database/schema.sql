-- Legacy MySQL schema. The current backend uses MongoDB; this file is not executed.
CREATE DATABASE IF NOT EXISTS crms CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE crms;
-- Hibernate creates and evolves tables from the JPA model in development.
-- This script creates the database; run it before starting the API.
-- For production, replace ddl-auto=update with versioned migrations.
CREATE DATABASE IF NOT EXISTS crms;

CREATE USER IF NOT EXISTS 'crms_user'@'localhost'
IDENTIFIED BY 'admin@123';

ALTER USER 'crms_user'@'localhost'
IDENTIFIED BY 'admin@123';

GRANT ALL PRIVILEGES ON crms.* TO 'crms_user'@'localhost';

FLUSH PRIVILEGES;
