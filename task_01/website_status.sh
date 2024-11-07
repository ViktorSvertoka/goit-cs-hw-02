#!/bin/bash

# Масив із вебсайтами для перевірки
websites=("https://github.com" "https://www.freecodecamp.org" "https://www.codewars.com" "https://copilot.microsoft.com" "https://chatgpt.com")

# Назва файлу логів з шляхом до папки task_01
log_file="task_01/website_status.txt"

# Очищення попереднього вмісту файлу логів
> "$log_file"

# Цикл перевірки доступності сайтів
for website in "${websites[@]}"
do
  # Використання curl для надсилання HTTP-запиту і збереження статус-коду
  http_status=$(curl -o /dev/null -s -w "%{http_code}" -L "$website")
  
  # Перевірка статус-коду (200 означає, що сайт доступний)
  if [ "$http_status" -eq 200 ]; then
    echo "$website is UP" >> "$log_file"
  else
    echo "$website is DOWN" >> "$log_file"
  fi
done

# Вивід повідомлення про завершення роботи скрипту
echo "Результати перевірки записано у файл $log_file"

