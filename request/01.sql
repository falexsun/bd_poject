-- Проекты с бюджетом выше среднего
SELECT title, budget 
FROM project_management.projects
WHERE budget > (SELECT AVG(budget) FROM project_management.projects)
ORDER BY budget DESC;