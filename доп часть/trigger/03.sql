--Триггер для логирования изменений статуса задач
CREATE OR REPLACE FUNCTION project_management.log_task_status_change()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.status <> OLD.status THEN
        INSERT INTO project_management.task_history 
            (task_id, changed_by, old_status, new_status)
        VALUES 
            (NEW.task_id, 1, OLD.status, NEW.status); -- Здесь можно добавить логику для определения пользователя
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_tasks_status_change
AFTER UPDATE ON project_management.tasks
FOR EACH ROW EXECUTE FUNCTION project_management.log_task_status_change();