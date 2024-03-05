-- Нормальна форма Бойса-Кодда (BCNF)
-- Не в BCNF
/*
  є викладачі, студенти та предмети
    1 студент вивчає багато предметів
    1 предмет викладаєтся багатьом студентам
    у одного викладача може бути багато студентів
    у студента багато викладачів
    у 1 предмета може бути багато викладачів
    у 1 викладача може бути тількі один предмет


    students n : m subjects
    students n : m teachers
    teachers n : 1 subjects
*/
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE students_to_teachers_to_subjects (
  teacher_id INT REFERENCES teachers,
  student_id INT REFERENCES students,
  subject TEXT,
  PRIMARY KEY (teacher_id, student_id)
);

INSERT INTO students_to_teachers_to_subjects
(teacher_id, student_id, subject)
VALUES 
(1,1, 'Math'),
(2,1, 'Physics'),
(3, 1, 'Biology'),
(1,2, 'Math'),
(2, 2, 'Music');
-- в BCNF
CREATE TABLE subjects (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE teachers (
  id SERIAL PRIMARY KEY,
  name TEXT,
  subject_id INT NOT NULL REFERENCES subjects
);


CREATE TABLE students_to_teachers (
  teacher_id INT REFERENCES teachers,
  student_id INT REFERENCES students,
  PRIMARY KEY (teacher_id, student_id)
);

INSERT INTO students_to_teachers
(teacher_id, student_id)
VALUES 
(1,1),
(2,1),
(3, 1),
(1,2),
(2, 2);