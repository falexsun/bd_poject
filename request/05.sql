-- Последнее изменение статуса задачи (Самосоединение)
SELECT t1.task_id, t1.new_status, t1.change_date
FROM project_management.task_history t1
LEFT JOIN project_management.task_history t2 
    ON t1.task_id = t2.task_id AND t1.change_date < t2.change_date
WHERE t2.change_date IS NULL;