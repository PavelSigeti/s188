# Используйте официальный образ Python как базовый образ
FROM python:3.9

# Установите рабочую директорию в контейнере
WORKDIR /usr/src/app

# Копируйте файл requirements.txt в текущую директорию в контейнере
COPY requirements.txt ./

# Установите все зависимости из файла requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копируйте содержимое вашего приложения в контейнер
COPY . .

# Установите Uvicorn для запуска вашего FastAPI приложения
RUN pip install uvicorn

# Используйте shell формат для команды CMD для запуска Uvicorn
CMD uvicorn main:app --host=0.0.0.0 --reload