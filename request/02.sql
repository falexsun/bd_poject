-- Сотрудники с количеством проектов (GROUP BY + HAVING)
SELECT e.first_name, e.last_name, COUNT(pa.project_id) AS project_count
FROM project_management.employees e
JOIN project_management.project_assignments pa ON e.employee_id = pa.employee_id
GROUP BY e.employee_id
HAVING COUNT(pa.project_id) >= 3
ORDER BY project_count DESC;