--Процедура для добавления нового проекта
CREATE OR REPLACE PROCEDURE project_management.add_project(
    p_title VARCHAR(255),
    p_client_id INTEGER,
    p_start_date DATE,
    p_end_date DATE,
    p_budget DECIMAL(15,2),
    p_status VARCHAR(50)
LANGUAGE SQL
AS $$
INSERT INTO project_management.projects 
    (title, client_id, start_date, end_date, budget, status)
VALUES 
    (p_title, p_client_id, p_start_date, p_end_date, p_budget, p_status);
$$;