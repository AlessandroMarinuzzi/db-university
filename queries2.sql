-- GROUP BY

-- Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id) AS iscritti, YEAR(enrolment_date) AS anno_iscrizione 
FROM students 
GROUP BY anno_iscrizione;

-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id) AS insegnanti, office_address AS edificio 
FROM teachers 
GROUP BY edificio;

-- Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(vote) AS media_voti, exam_id 
FROM exam_student 
GROUP BY exam_id;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS numero_corsi, department_id 
FROM degrees 
GROUP BY department_id;

-- JOIN

-- Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.* 
FROM students 
JOIN degrees 
ON students.degree_id = degrees.id
WHERE degrees.name = "Corso di Laurea in Economia";

-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT degrees.* 
FROM degrees 
JOIN departments 
ON degrees.department_id = departments.id
WHERE departments.name = "Dipartimento di Neuroscienze";

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.* 
FROM course_teacher 
JOIN courses 
ON course_teacher.course_id = courses.id
WHERE course_teacher.teacher_id = 44;

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.id, students.name, students.surname, students.enrolment_date, degrees.name AS corso_frequentato, departments.name AS dipartimento_relativo
FROM students
JOIN degrees
ON students.degree_id = degrees.id
JOIN departments
ON degrees.department_id = departments.id
ORDER BY students.surname, students.name ASC;

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name AS degree_name, courses.name AS course_name, teachers.name AS teacher_name, teachers.surname AS teacher_surname
FROM degrees
JOIN courses                   
ON degrees.id = courses.degree_id
JOIN course_teacher
ON course_teacher.course_id = courses.id
JOIN teachers
ON course_teacher.teacher_id = teachers.id;

-- Selezionare tutti i docenti che insegnano nel dipartimento di matematica
SELECT departments.name AS nome_dipartimento, departments.address, departments.website, teachers.name AS nome_docente, teachers.surname AS cognome_docente
FROM departments
JOIN degrees ON degrees.department_id = departments.id 
JOIN course ON degrees.id = courses.degree_id
JOIN course_teacher ON courses.id = course_teacher.course_id
JOIN teachers ON course_teacher.teacher_id = teachers.id
WHERE departments.name = "Dipartimento di Matematica"

