-- Количество записей в таблицах
SELECT 'clients' AS table_name, COUNT(*) FROM project_management.clients
UNION ALL
SELECT 'projects', COUNT(*) FROM project_management.projects
UNION ALL
SELECT 'employees', COUNT(*) FROM project_management.employees
UNION ALL
SELECT 'project_assignments', COUNT(*) FROM project_management.project_assignments
UNION ALL
SELECT 'tasks', COUNT(*) FROM project_management.tasks
UNION ALL
SELECT 'task_history', COUNT(*) FROM project_management.task_history;