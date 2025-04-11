-- Ранжирование проектов по бюджету (Оконная функция)
SELECT title, budget,
       RANK() OVER (ORDER BY budget DESC) AS budget_rank
FROM project_management.projects;