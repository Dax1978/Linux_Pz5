FROM python:3.12-alpine3.19

# This flag is important to output python logs correctly in docker!
ENV PYTHONUNBUFFERED 1
# Flag to optimize container size a bit by removing runtime python cache
ENV PYTHONDONTWRITEBYTECODE 1

# Устанавливаю рабочую директорию
WORKDIR /app

# Копирую файл зависимостей (в данном случае их нет, но знать нужно...) 
COPY requirements.txt .

# Запускаю команду, выполняющуюся ВО ВРЕМЯ СБОРКИ контейнера
RUN pip install --upgrade pip && \
    pip3 install -r requirements.txt

# Копирую файл hello.py в рабочую директорию в контейнере
COPY hello.py .

# Запускаю команду, выполняющуюся ПОСЛЕ СБОРКИ контейнера
CMD ["python", "hello.py"]