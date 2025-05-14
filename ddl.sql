-- Удаление схемы если существует (для пересоздания)
DROP SCHEMA IF EXISTS project_management CASCADE;

-- Создание схемы
CREATE SCHEMA project_management;

----------------
-- Клиенты
----------------
CREATE TABLE IF NOT EXISTS project_management.clients (
    client_id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

----------------
-- Сотрудники
----------------
CREATE TABLE IF NOT EXISTS project_management.employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    hire_date DATE NOT NULL
);

----------------
-- Проекты
----------------
CREATE TABLE IF NOT EXISTS project_management.projects (
    project_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    client_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget DECIMAL(15,2),
    status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_client FOREIGN KEY (client_id) 
        REFERENCES project_management.clients(client_id)
        ON DELETE RESTRICT,
    CONSTRAINT valid_dates CHECK (start_date <= end_date)
);

----------------
-- Назначения на проекты (таблица-связка)
----------------
CREATE TABLE IF NOT EXISTS project_management.project_assignments (
    assignment_id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    role VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    CONSTRAINT fk_project FOREIGN KEY (project_id) 
        REFERENCES project_management.projects(project_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) 
        REFERENCES project_management.employees(employee_id)
        ON DELETE CASCADE
);

----------------
-- Задачи
----------------
CREATE TABLE IF NOT EXISTS project_management.tasks (
    task_id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'open',
    priority VARCHAR(20) DEFAULT 'medium',
    due_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_project FOREIGN KEY (project_id) 
        REFERENCES project_management.projects(project_id)
        ON DELETE CASCADE
);

----------------
-- История изменений задач (версионная таблица)
----------------
CREATE TABLE IF NOT EXISTS project_management.task_history (
    history_id SERIAL PRIMARY KEY,
    task_id INTEGER NOT NULL,
    changed_by INTEGER,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_task FOREIGN KEY (task_id) 
        REFERENCES project_management.tasks(task_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_employee FOREIGN KEY (changed_by) 
        REFERENCES project_management.employees(employee_id)
        ON DELETE SET NULL
);