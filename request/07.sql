-- Средний бюджет по статусам проектов (GROUP BY)
SELECT status, AVG(budget) AS avg_budget
FROM project_management.projects
GROUP BY status
HAVING AVG(budget) > 30000;