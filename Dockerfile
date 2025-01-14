# Используем официальный образ Python
FROM python:3.13.1-slim

# Устанавливаем необходимые зависимости
RUN apt update && apt upgrade -y && apt install -y \
    sshpass \
    openssh-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем Ansible
RUN pip install --no-cache-dir ansible

# Устанавливаем рабочую директорию
WORKDIR /ansible

# Указываем команду по умолчанию
CMD ["ansible", "--version"]