-- Клиенты без проектов (RIGHT JOIN)
SELECT c.company_name, p.title
FROM project_management.projects p
RIGHT JOIN project_management.clients c ON p.client_id = c.client_id
WHERE p.project_id IS NULL;