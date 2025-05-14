--Представление "Сотрудники с количеством задач"
CREATE OR REPLACE VIEW project_management.employees_task_stats AS
SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    e.position,
    COUNT(DISTINCT pa.project_id) AS projects_count,
    COUNT(t.task_id) AS tasks_assigned
FROM 
    project_management.employees e
LEFT JOIN 
    project_management.project_assignments pa ON e.employee_id = pa.employee_id
LEFT JOIN 
    project_management.tasks t ON pa.project_id = t.project_id
GROUP BY 
    e.employee_id;