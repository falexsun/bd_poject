-- Создание схемы
DROP SCHEMA IF EXISTS project_management CASCADE;
CREATE SCHEMA project_management;

-- Таблица Клиенты
CREATE TABLE project_management.clients (
    client_id SERIAL PRIMARY KEY,
    company_name VARCHAR(255) NOT NULL,
    contact_person VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Таблица Проекты
CREATE TABLE project_management.projects (
    project_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50) DEFAULT 'active',
    client_id INTEGER NOT NULL REFERENCES project_management.clients(client_id),
    budget DECIMAL(15,2)
);

-- Таблица Сотрудники
CREATE TABLE project_management.employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    hire_date DATE NOT NULL
);

-- Таблица-связка: Назначения сотрудников на проекты
CREATE TABLE project_management.project_assignments (
    assignment_id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL REFERENCES project_management.projects(project_id),
    employee_id INTEGER NOT NULL REFERENCES project_management.employees(employee_id),
    role VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

-- Таблица Задачи
CREATE TABLE project_management.tasks (
    task_id SERIAL PRIMARY KEY,
    project_id INTEGER NOT NULL REFERENCES project_management.projects(project_id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'open',
    priority VARCHAR(20) DEFAULT 'medium',
    due_date DATE
);

-- Таблица-версия: История изменений задач
CREATE TABLE project_management.task_history (
    history_id SERIAL PRIMARY KEY,
    task_id INTEGER NOT NULL REFERENCES project_management.tasks(task_id),
    changed_by INTEGER REFERENCES project_management.employees(employee_id),
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);