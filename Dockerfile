# Используем базовый образ Ubuntu
FROM ubuntu

# Обновляем пакеты и устанавливаем необходимые утилиты
RUN apt-get update && \
    apt-get install -y wget curl nginx

# Копируем файлы сайта в контейнер
COPY /usr/share/nginx/html /var/www/html

# Устанавливаем рабочую директорию
WORKDIR /var/www/html

# Запускаем Nginx при старте контейнера
ENTRYPOINT service nginx start

# Описываем команду для выполнения при запуске контейнера
CMD [ "nginx", "-g", "daemon off;" ]
