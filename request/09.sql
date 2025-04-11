-- История изменений с именем сотрудника (INNER JOIN)
SELECT th.change_date, e.first_name, th.new_status
FROM project_management.task_history th
INNER JOIN project_management.employees e ON th.changed_by = e.employee_id
ORDER BY th.change_date DESC
LIMIT 10;