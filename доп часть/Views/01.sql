--Представление "Активные проекты с бюджетом выше среднего
CREATE OR REPLACE VIEW project_management.active_expensive_projects AS
SELECT 
    p.title,
    c.company_name AS client,
    p.budget,
    p.start_date,
    p.end_date
FROM 
    project_management.projects p
JOIN 
    project_management.clients c ON p.client_id = c.client_id
WHERE 
    p.status = 'active'
    AND p.budget > (SELECT AVG(budget) FROM project_management.projects);