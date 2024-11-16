#!/bin/bash

# Список вебсайтів для перевірки
websites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
)

# Назва файлу логів
log_file="website_status.log"

# Очищуємо файл логів перед записом
> "$log_file"

# Цикл для перевірки кожного сайту
for website in "${websites[@]}"; do
  # Використовуємо curl для перевірки доступності сайту
  response=$(curl -s -o /dev/null -w "%{http_code}" -L "$website")

  if [ "$response" -eq 200 ]; then
    # Якщо статус-код 200, сайт доступний
    echo "<$website> is UP" | tee -a "$log_file"
  else
    # Інакше сайт недоступний
    echo "<$website> is DOWN (HTTP status: $response)" | tee -a "$log_file"
  fi
done

# Виведення підсумкового повідомлення
echo "Results have been logged to $log_file"


