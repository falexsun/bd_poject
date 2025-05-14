--Триггер для проверки дат проекта
CREATE OR REPLACE FUNCTION project_management.validate_project_dates()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.start_date > NEW.end_date THEN
        RAISE EXCEPTION 'Дата начала проекта не может быть позже даты окончания';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trg_projects_dates
BEFORE INSERT OR UPDATE ON project_management.projects
FOR EACH ROW EXECUTE FUNCTION project_management.validate_project_dates();