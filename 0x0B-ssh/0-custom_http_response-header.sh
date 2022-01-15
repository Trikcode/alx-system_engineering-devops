#!/usr/bin/env bash
# Configure your Nginx server to have a custom 404 page that contains a string

ADD301_REDIRECT="\\\tlocation /redirect_me {\n\t\t return 301 https://google.com;\n\t}\n"
ADD404_NOTFOUND="error_page 404 /custom_404.html;\n\\tlocation = /custom_404.html {\n\t\t root /usr/share/nginx/html;\n\t\tinternal;\n\t}\n"
PATTERN="#error_page 404 /404.html;"
CUSTOM_HEADER="\\\tadd_header X-Served-By 525-web-02;"
sudo apt-get update
sudo apt-get -y install nginx
sudo service nginx start
echo "Hello World!" | sudo tee /usr/share/nginx/html/index.html
echo "Holberton School for the win!" | sudo tee /var/www/html/index.html
sudo sed -i "30i $ADD301_REDIRECT" /etc/nginx/sites-available/default
echo "Ceci n'est pas une page" | sudo tee /usr/share/nginx/html/custom_404.html
sudo sed -i "s@$PATTERN@$ADD404_NOTFOUND@" /etc/nginx/sites-available/default
sudo sed -i "30i $CUSTOM_HEADER" /etc/nginx/sites-available/default
sudo service nginx restart
