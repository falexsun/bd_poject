--Триггер для автоматического обновления updated_at
CREATE OR REPLACE FUNCTION project_management.update_timestamp()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_projects_update
BEFORE UPDATE ON project_management.projects
FOR EACH ROW EXECUTE FUNCTION project_management.update_timestamp();