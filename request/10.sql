-- Пагинация проектов (LIMIT + OFFSET)
SELECT title, start_date, end_date
FROM project_management.projects
ORDER BY start_date
LIMIT 5 OFFSET 5;