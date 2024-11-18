CREATE TABLE `your_project_id.your_dataset_id.students` (
    student_id STRING NOT NULL,
    first_name STRING,
    last_name STRING,
    date_of_birth DATE,
    gender STRING,
    grade_level INT64,
    email STRING,
    phone_number STRING,
    address STRING,
    enrollment_date DATE,
    gpa FLOAT64
);

INSERT INTO `your_project_id.your_dataset_id.students`
WITH student_data AS (
  SELECT
    FORMAT("ST%06d", seq) AS student_id,
    (SELECT AS VALUE ARRAY['John', 'Emma', 'Liam', 'Olivia', 'Sophia', 'Noah', 'Mason', 'Ava', 'Isabella', 'Lucas'][OFFSET(CAST(FLOOR(RAND() * 10) AS INT64))]) AS first_name,
    (SELECT AS VALUE ARRAY['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor'][OFFSET(CAST(FLOOR(RAND() * 10) AS INT64))]) AS last_name,
    DATE_SUB(CURRENT_DATE(), INTERVAL CAST(FLOOR(RAND() * 10000) + 5475 AS INT64) DAY) AS date_of_birth,
    (SELECT AS VALUE ARRAY['Male', 'Female', 'Non-Binary', 'Other'][OFFSET(CAST(FLOOR(RAND() * 4) AS INT64))]) AS gender,
    CAST(FLOOR(RAND() * 12 + 1) AS INT64) AS grade_level,
    FORMAT('%s.%s@studentemail.com',
           (SELECT AS VALUE ARRAY['John', 'Emma', 'Liam', 'Olivia', 'Sophia', 'Noah', 'Mason', 'Ava', 'Isabella', 'Lucas'][OFFSET(CAST(FLOOR(RAND() * 10) AS INT64))]),
           (SELECT AS VALUE ARRAY['Smith', 'Johnson', 'Williams', 'Jones', 'Brown', 'Davis', 'Miller', 'Wilson', 'Moore', 'Taylor'][OFFSET(CAST(FLOOR(RAND() * 10) AS INT64))])) AS email,
    FORMAT("+1-%03d-%03d-%04d", 
           CAST(FLOOR(RAND() * 1000) AS INT64), 
           CAST(FLOOR(RAND() * 1000) AS INT64), 
           CAST(FLOOR(RAND() * 10000) AS INT64)) AS phone_number,
    (SELECT AS VALUE ARRAY['123 Main St', '456 Oak Ave', '789 Pine Ln', '101 Maple Rd', '202 Elm St'][OFFSET(CAST(FLOOR(RAND() * 5) AS INT64))]) AS address,
    DATE_SUB(CURRENT_DATE(), INTERVAL CAST(FLOOR(RAND() * 1825) AS INT64) DAY) AS enrollment_date,
    ROUND(RAND() * 4, 2) AS gpa
  FROM
    UNNEST(GENERATE_ARRAY(1, 1000000)) AS seq
)
SELECT * FROM student_data;
