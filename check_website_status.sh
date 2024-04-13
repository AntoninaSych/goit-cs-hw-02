# Оголошення масиву з URL-адресами веб-сайтів
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
    # додайте інші веб-сайти, які ви хочете перевірити, в цьому списку
)

# Цикл для перевірки доступності кожного веб-сайту
for site in "${websites[@]}"; do
    response=$(curl -s -o /dev/null -w "%{http_code}" -L "$site")
    if [ "$response" -eq 200 ] || [ "$response" -eq 301 ]; then
        echo "$site is UP (HTTP status: $response)"
        echo "$site is UP (HTTP status: $response)" >> website_status.log
    else
        echo "$site is DOWN (HTTP status: $response)"
        echo "$site is DOWN (HTTP status: $response)" >> website_status.log
    fi
done
