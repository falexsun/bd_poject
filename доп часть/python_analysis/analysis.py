import psycopg2
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import os

# Подключение к БД
conn = psycopg2.connect(
    dbname="mipt_HW",
    user="postgres",
    password="postgres",
    host="localhost",
    port="5432"
)

# Получаем существующие project_id
cursor = conn.cursor()
cursor.execute("SELECT project_id FROM project_management.projects;")
existing_project_ids = [row[0] for row in cursor.fetchall()]

print("Существующие project_id:", existing_project_ids)

# Если нет проектов — создаём тестовый
if not existing_project_ids:
    print("Нет проектов в БД. Создаём тестовый проект...")
    cursor.execute("""
        INSERT INTO project_management.projects 
        (title, client_id, start_date, end_date, budget, status)
        VALUES 
        ('Test Project', 1, CURRENT_DATE, CURRENT_DATE + INTERVAL '1 month', 10000, 'active')
        RETURNING project_id;
    """)
    conn.commit()
    project_id = cursor.fetchone()[0]
    existing_project_ids = [project_id]

# Генерация данных только с реальными project_id
tasks_data = {
    "project_id": np.random.choice(existing_project_ids, 50),
    "title": [f"Task {i}" for i in range(1, 51)],
    "status": np.random.choice(["open", "in_progress", "completed"], 50),
    "priority": np.random.choice(["low", "medium", "high"], 50)
}

df_tasks = pd.DataFrame(tasks_data)

# Вставка данных
cursor = conn.cursor()
for _, row in df_tasks.iterrows():
    cursor.execute(
        "INSERT INTO project_management.tasks (project_id, title, status, priority) VALUES (%s, %s, %s, %s)",
        (row["project_id"], row["title"], row["status"], row["priority"])
    )
conn.commit()

# --- Загрузка данных для анализа ---
df = pd.read_sql("SELECT status, priority FROM project_management.tasks", conn)

# --- Создание папки для графиков ---
plots_dir = os.path.join("доп часть", "python_analysis", "plots")
os.makedirs(plots_dir, exist_ok=True)

# --- График 1: Распределение задач по статусам ---
df["status"].value_counts().plot(kind="bar", title="Распределение задач по статусам")
plt.xlabel("Статус")
plt.ylabel("Количество задач")
plt.tight_layout()
plt.savefig(os.path.join(plots_dir, "status_distribution.png"))
plt.close()

# --- График 2: Соотношение приоритетов ---
df["priority"].value_counts().plot(kind="pie", autopct="%1.1f%%", title="Приоритеты задач")
plt.ylabel("")
plt.tight_layout()
plt.savefig(os.path.join(plots_dir, "priority_distribution.png"))
plt.close()

# --- График 3: Зависимость статуса от приоритета ---
pd.crosstab(df["status"], df["priority"]).plot(kind="bar", stacked=True)
plt.title("Статусы задач по приоритетам")
plt.xlabel("Статус")
plt.ylabel("Количество")
plt.tight_layout()
plt.savefig(os.path.join(plots_dir, "status_vs_priority.png"))
plt.close()

print(f"Графики успешно сохранены в папке '{plots_dir}'")