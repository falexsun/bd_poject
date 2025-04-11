-- Задачи с историей изменений (LEFT JOIN + подзапрос)
SELECT t.title, th.change_date, th.new_status
FROM project_management.tasks t
LEFT JOIN project_management.task_history th ON t.task_id = th.task_id
WHERE t.task_id IN (SELECT task_id FROM project_management.task_history WHERE changed_by = 1);