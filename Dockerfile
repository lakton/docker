# Используем базовый образ Ubuntu
FROM ubuntu

# Обновляем пакеты и устанавливаем необходимые утилиты
RUN apt-get update && apt-get install -y wget curl nginx

# Копируем файлы сайта в контейнер
COPY ./путь_к_файлам_сайта /var/www/html

# Устанавливаем переменную окружения для пароля root пользователя PostgreSQL
ENV POSTGRES_PASSWORD=mysecretpassword

# Устанавливаем рабочую директорию
WORKDIR /var/www/html

# Запускаем Nginx при старте контейнера
ENTRYPOINT service nginx start && bash

# Описываем команду для выполнения при запуске контейнера
CMD [ "nginx", "-g", "daemon off;" ]
