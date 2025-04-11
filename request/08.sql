-- Задачи с истекшим сроком (WHERE + дата)
SELECT title, due_date
FROM project_management.tasks
WHERE due_date < CURRENT_DATE AND status != 'completed';