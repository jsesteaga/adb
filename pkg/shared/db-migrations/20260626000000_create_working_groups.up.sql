ALTER TABLE working_groups
    ADD COLUMN chapter_id INT DEFAULT NULL;

CREATE TABLE IF NOT EXISTS activist_working_groups(
    activist_id INT NOT NULL,
    working_group_id INT NOT NULL,
    PRIMARY KEY (activist_id, working_group_id),
    INDEX (working_group_id)
);
