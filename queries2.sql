-- GROUP BY

-- Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id) AS iscritti, YEAR(enrolment_date) AS anno_iscrizione 
FROM students 
GROUP BY anno_iscrizione

-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id) AS insegnanti, office_address AS edificio 
FROM teachers 
GROUP BY edificio

-- Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(vote) AS media_voti, exam_id 
FROM exam_student 
GROUP BY exam_id

-- Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS numero_corsi, department_id 
FROM degrees 
GROUP BY department_id