import psycopg2
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

# Подключение к БД
conn = psycopg2.connect(
    dbname="your_db",
    user="your_user",
    password="your_password",
    host="localhost"
)

# Генерация случайных данных для задач
tasks_data = {
    "project_id": np.random.randint(1, 16, 50),
    "title": [f"Task {i}" for i in range(1, 51)],
    "status": np.random.choice(["open", "in_progress", "completed"], 50),
    "priority": np.random.choice(["low", "medium", "high"], 50)
}

# Вставка данных
df_tasks = pd.DataFrame(tasks_data)
cursor = conn.cursor()
for _, row in df_tasks.iterrows():
    cursor.execute(
        "INSERT INTO project_management.tasks (project_id, title, status, priority) VALUES (%s, %s, %s, %s)",
        (row["project_id"], row["title"], row["status"], row["priority"])
    )
conn.commit()

""""""

# Загрузка данных о задачах
df = pd.read_sql("SELECT status, priority FROM project_management.tasks", conn)

# График 1: Распределение задач по статусам
df["status"].value_counts().plot(kind="bar", title="Распределение задач по статусам")
plt.show()

# График 2: Соотношение приоритетов
df["priority"].value_counts().plot(kind="pie", autopct="%1.1f%%", title="Приоритеты задач")
plt.show()

# График 3: Зависимость статуса от приоритета
pd.crosstab(df["status"], df["priority"]).plot(kind="bar", stacked=True)
plt.title("Статусы задач по приоритетам")
plt.show()