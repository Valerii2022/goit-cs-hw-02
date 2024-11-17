websites=(
  "https://google.com"
  "https://facebook.com"
  "https://twitter.com"
)

log_file="website_status.log"

> "$log_file"

for website in "${websites[@]}"; do
  response=$(curl -s -o /dev/null -w "%{http_code}" -L "$website")

  if [ "$response" -eq 200 ]; then
    echo "<$website> is UP" | tee -a "$log_file"
  else
    echo "<$website> is DOWN (HTTP status: $response)" | tee -a "$log_file"
  fi
done

echo "Results have been logged to $log_file"


