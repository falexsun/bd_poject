--Функция для расчета оставшегося бюджета проекта
CREATE OR REPLACE FUNCTION project_management.get_remaining_budget(p_project_id INTEGER)
RETURNS DECIMAL(15,2)
LANGUAGE SQL
AS $$
SELECT 
    p.budget - COALESCE(SUM(b.amount), 0)
FROM 
    project_management.projects p
LEFT JOIN 
    project_management.budgets b ON p.project_id = b.project_id
WHERE 
    p.project_id = p_project_id
GROUP BY 
    p.budget;
$$;