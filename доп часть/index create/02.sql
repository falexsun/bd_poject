--Индекс для ускорения поиска проектов по клиенту
CREATE INDEX idx_projects_client_id ON project_management.projects(client_id);