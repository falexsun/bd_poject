----------------
-- Клиенты (15+ строк)
----------------
INSERT INTO project_management.clients (company_name, contact_person, email, phone)
VALUES 
    ('Tech Innovators', 'John Carter', 'john.carter@techinnovators.com', '+15551234567'),
    ('Green Energy Solutions', 'Emma Wilson', 'emma.wilson@greenenergy.com', '+15559876543'),
    ('Future Systems', 'Michael Brown', 'michael.brown@futuresystems.com', '+15557778899'),
    ('Data Dynamics', 'Sarah Lee', 'sarah.lee@datadynamics.com', '+15556667777'),
    ('Cloud Masters', 'David Kim', 'david.kim@cloudmasters.com', '+15554443333'),
    ('AI Pioneers', 'Linda Johnson', 'linda.johnson@aipioneers.com', '+15553332222'),
    ('Smart Logistics', 'Robert Davis', 'robert.davis@smartlogistics.com', '+15552221111'),
    ('Cyber Security Pro', 'Emily White', 'emily.white@cybersecuritypro.com', '+15551112222'),
    ('Digital Marketing Co', 'Daniel Green', 'daniel.green@digitalmarketingco.com', '+15550001111'),
    ('Health Tech Labs', 'Sophia Clark', 'sophia.clark@healthtechlabs.com', '+15559998888'),
    ('EduFuture', 'James Wilson', 'james.wilson@edufuture.com', '+15558887777'),
    ('FinTech Global', 'Olivia Taylor', 'olivia.taylor@fintechglobal.com', '+15557776666'),
    ('AutoDrive Systems', 'William Moore', 'william.moore@autodrive.com', '+15556665555'),
    ('Space Explorers', 'Ava Martinez', 'ava.martinez@spaceexplorers.com', '+15555554444'),
    ('EcoBuilders', 'Ethan Anderson', 'ethan.anderson@ecobuilders.com', '+15554443322');

----------------
-- Сотрудники (15+ строк)
----------------
INSERT INTO project_management.employees (first_name, last_name, position, email, hire_date)
VALUES
    ('Alice', 'Smith', 'Project Manager', 'alice.smith@company.com', '2020-03-15'),
    ('Bob', 'Johnson', 'Senior Developer', 'bob.johnson@company.com', '2019-07-01'),
    ('Charlie', 'Williams', 'UX Designer', 'charlie.williams@company.com', '2021-01-10'),
    ('Diana', 'Brown', 'QA Engineer', 'diana.brown@company.com', '2021-05-20'),
    ('Evan', 'Davis', 'DevOps Engineer', 'evan.davis@company.com', '2020-11-05'),
    ('Fiona', 'Miller', 'Data Analyst', 'fiona.miller@company.com', '2022-02-28'),
    ('George', 'Wilson', 'Frontend Developer', 'george.wilson@company.com', '2021-08-15'),
    ('Hannah', 'Moore', 'Backend Developer', 'hannah.moore@company.com', '2020-09-12'),
    ('Ian', 'Taylor', 'Product Owner', 'ian.taylor@company.com', '2019-12-01'),
    ('Jessica', 'Anderson', 'Scrum Master', 'jessica.anderson@company.com', '2022-04-10'),
    ('Kevin', 'Thomas', 'Mobile Developer', 'kevin.thomas@company.com', '2021-06-25'),
    ('Laura', 'Jackson', 'SysAdmin', 'laura.jackson@company.com', '2020-04-05'),
    ('Mike', 'White', 'Security Specialist', 'mike.white@company.com', '2021-03-18'),
    ('Nora', 'Harris', 'Technical Writer', 'nora.harris@company.com', '2022-07-30'),
    ('Oscar', 'Martin', 'Business Analyst', 'oscar.martin@company.com', '2020-10-20');

----------------
-- Проекты (15+ строк)
----------------
INSERT INTO project_management.projects (title, client_id, start_date, end_date, budget, status)
VALUES
    ('E-Commerce Platform', 1, '2023-01-10', '2023-09-30', 120000.00, 'active'),
    ('AI Chatbot Development', 6, '2023-02-15', '2023-12-01', 95000.00, 'active'),
    ('Cloud Migration', 5, '2023-03-01', '2023-08-15', 75000.00, 'completed'),
    ('Health Data Analytics', 10, '2023-04-10', '2024-02-28', 200000.00, 'active'),
    ('Mobile Banking App', 12, '2023-05-20', '2023-11-30', 150000.00, 'on_hold'),
    ('Autonomous Vehicle Software', 13, '2023-06-01', '2024-06-01', 500000.00, 'active'),
    ('Cybersecurity Overhaul', 8, '2023-07-15', '2023-10-31', 85000.00, 'completed'),
    ('EdTech Platform', 11, '2023-08-01', '2024-01-15', 110000.00, 'active'),
    ('Smart Home System', 3, '2023-09-10', '2024-03-31', 135000.00, 'active'),
    ('Green Energy Dashboard', 2, '2023-10-05', '2024-04-20', 90000.00, 'planning'),
    ('Digital Marketing Suite', 9, '2023-11-01', '2024-05-30', 80000.00, 'active'),
    ('Blockchain Payment Gateway', 12, '2023-12-15', '2024-07-01', 175000.00, 'active'),
    ('AR Navigation System', 13, '2024-01-10', '2024-09-15', 220000.00, 'planning'),
    ('IoT Warehouse Management', 7, '2024-02-01', '2024-08-31', 160000.00, 'active'),
    ('Eco-Friendly Construction App', 15, '2024-03-15', '2024-10-31', 95000.00, 'active');

----------------
-- Назначения на проекты (30+ строк)
----------------
INSERT INTO project_management.project_assignments (project_id, employee_id, role, start_date)
VALUES
    -- Проект 1 (10 сотрудников)
    (1, 1, 'Project Manager', '2023-01-10'),
    (1, 2, 'Lead Developer', '2023-01-10'),
    (1, 3, 'UI Designer', '2023-01-15'),
    (1, 4, 'QA Engineer', '2023-02-01'),
    (1, 5, 'DevOps Engineer', '2023-02-01'),
    (1, 7, 'Frontend Developer', '2023-02-10'),
    (1, 8, 'Backend Developer', '2023-02-10'),
    (1, 12, 'SysAdmin', '2023-03-01'),
    (1, 14, 'Technical Writer', '2023-03-15'),
    (1, 15, 'Business Analyst', '2023-04-01'),
    
    -- Проект 2 (8 сотрудников)
    (2, 1, 'Project Manager', '2023-02-15'),
    (2, 6, 'Data Scientist', '2023-02-20'),
    (2, 7, 'Frontend Developer', '2023-03-01'),
    (2, 9, 'Product Owner', '2023-03-01'),
    (2, 11, 'Mobile Developer', '2023-03-10'),
    (2, 13, 'Security Specialist', '2023-03-15'),
    (2, 14, 'Technical Writer', '2023-04-01'),
    (2, 15, 'Business Analyst', '2023-04-01'),
    
    -- Проект 3 (5 сотрудников)
    (3, 5, 'DevOps Lead', '2023-03-01'),
    (3, 8, 'Backend Developer', '2023-03-10'),
    (3, 12, 'SysAdmin', '2023-03-15'),
    (3, 10, 'Scrum Master', '2023-04-01'),
    (3, 4, 'QA Engineer', '2023-04-10'),
    
    -- Проект 4 (7 сотрудников)
    (4, 2, 'Lead Developer', '2023-04-10'),
    (4, 6, 'Data Analyst', '2023-04-15'),
    (4, 9, 'Product Owner', '2023-05-01'),
    (4, 11, 'Mobile Developer', '2023-05-10'),
    (4, 13, 'Security Specialist', '2023-05-15'),
    (4, 14, 'Technical Writer', '2023-06-01'),
    (4, 15, 'Business Analyst', '2023-06-01');

----------------
-- Задачи (15+ строк)
----------------
INSERT INTO project_management.tasks (project_id, title, description, status, priority, due_date)
VALUES
    -- Проект 1
    (1, 'Design Homepage', 'Create responsive homepage layout', 'completed', 'high', '2023-02-28'),
    (1, 'Implement Payment Gateway', 'Integrate Stripe API', 'in_progress', 'critical', '2023-03-31'),
    (1, 'User Authentication', 'Develop OAuth2 flow', 'completed', 'high', '2023-03-15'),
    (1, 'Database Optimization', 'Optimize SQL queries', 'open', 'medium', '2023-04-30'),
    
    -- Проект 2
    (2, 'Train AI Model', 'Collect and preprocess data', 'in_progress', 'high', '2023-04-15'),
    (2, 'Deploy to Cloud', 'AWS Lambda setup', 'open', 'medium', '2023-05-31'),
    (2, 'UI for Chatbot', 'Design conversation flow', 'completed', 'low', '2023-03-20'),
    
    -- Проект 3
    (3, 'Migrate Database', 'Move from MySQL to PostgreSQL', 'completed', 'high', '2023-04-30'),
    (3, 'Security Audit', 'Check vulnerabilities', 'completed', 'critical', '2023-05-15'),
    
    -- Проект 4
    (4, 'Data Cleaning', 'Process patient records', 'in_progress', 'high', '2023-06-30'),
    (4, 'Build Dashboard', 'Visualize health metrics', 'open', 'medium', '2023-07-15'),
    
    -- Проект 5
    (5, 'Mobile App Prototype', 'Figma design', 'on_hold', 'low', '2023-06-01'),
    (5, 'API Development', 'RESTful endpoints', 'open', 'high', '2023-07-31'),
    
    -- Проект 6
    (6, 'Sensor Integration', 'LIDAR data processing', 'in_progress', 'critical', '2024-01-31'),
    (6, 'Pathfinding Algorithm', 'Optimize for real-time', 'open', 'high', '2024-02-28');

----------------
-- История изменений задач (30+ строк)
----------------
INSERT INTO project_management.task_history (task_id, changed_by, old_status, new_status)
VALUES
    -- Задача 1: 3 изменения
    (1, 1, NULL, 'open'),
    (1, 3, 'open', 'in_progress'),
    (1, 3, 'in_progress', 'completed'),
    
    -- Задача 2: 4 изменения
    (2, 2, NULL, 'open'),
    (2, 2, 'open', 'in_progress'),
    (2, 5, 'in_progress', 'blocked'),
    (2, 2, 'blocked', 'in_progress'),
    
    -- Задача 3: 2 изменения
    (3, 8, NULL, 'open'),
    (3, 8, 'open', 'completed'),
    
    -- Задача 4: 3 изменения
    (4, 4, NULL, 'open'),
    (4, 4, 'open', 'in_progress'),
    (4, 12, 'in_progress', 'open'),
    
    -- ... (продолжить для остальных задач, минимум 30 строк)
    
    -- Пример для задач 5-15:
    (5, 6, NULL, 'open'),
    (5, 6, 'open', 'in_progress'),
    (6, 7, NULL, 'open'),
    (7, 3, NULL, 'open'),
    (7, 3, 'open', 'completed'),
    (8, 5, NULL, 'open'),
    (8, 5, 'open', 'completed'),
    (9, 13, NULL, 'open'),
    (9, 13, 'open', 'completed'),
    (10, 2, NULL, 'open'),
    (10, 2, 'open', 'in_progress'),
    (11, 9, NULL, 'open'),
    (12, 11, NULL, 'open'),
    (13, 1, NULL, 'open'),
    (14, 2, NULL, 'open'),
    (14, 2, 'open', 'in_progress'),
    (15, 8, NULL, 'open'),
    (15, 8, 'open', 'in_progress');