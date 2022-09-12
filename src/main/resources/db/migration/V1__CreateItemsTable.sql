CREATE TYPE ITEM_TYPE AS ENUM ('FILE', 'FOLDER');
CREATE CAST (CHARACTER VARYING AS ITEM_TYPE) WITH INOUT AS IMPLICIT;

CREATE TABLE IF NOT EXISTS items (
    id VARCHAR(100) PRIMARY KEY NOT NULL,
    file_url VARCHAR(255),
    update_time TIMESTAMP WITH TIME ZONE NOT NULL,
    parent_id VARCHAR(100),
    item_type ITEM_TYPE NOT NULL,
    item_size bigint,
    FOREIGN KEY (parent_id) REFERENCES items(id)
);