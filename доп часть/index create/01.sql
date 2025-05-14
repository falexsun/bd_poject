--Индекс для ускорения поиска задач по статусу
CREATE INDEX idx_tasks_status ON project_management.tasks(status);