-- 2 Нормальна форма ( 2NF )
-- не в 2NF
CREATE TABLE teachers_to_course (
  teacher_id INT,
  course TEXT,
  teacher_phone TEXT,
  PRIMARY KEY (teacher_id, course)
);

INSERT INTO teachers_to_course 
(teacher_id, course, teacher_phone)
VALUES
(1, 'Math', '3464643543'),
(2, 'Physics', '4879546544'),
(2, 'Math', '4879546544'),
(3, 'Music', '12323432423');
-- 2 NF
CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  teacher_phone TEXT
)

CREATE TABLE teachers_to_course (
  teacher_id INT REFERENCES teachers,
  course TEXT,
  PRIMARY KEY (teacher_id, course)
);
