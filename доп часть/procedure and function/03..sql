--Процедура для обновления статуса задачи
CREATE OR REPLACE PROCEDURE project_management.update_task_status(
    p_task_id INTEGER,
    p_new_status VARCHAR(50),
    p_changed_by INTEGER)
LANGUAGE SQL
AS $$
BEGIN
    UPDATE project_management.tasks 
    SET status = p_new_status 
    WHERE task_id = p_task_id;
    
    INSERT INTO project_management.task_history 
        (task_id, changed_by, old_status, new_status)
    SELECT 
        p_task_id, 
        p_changed_by, 
        status, 
        p_new_status
    FROM 
        project_management.tasks
    WHERE 
        task_id = p_task_id;
END;
$$;