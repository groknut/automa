server {


	root /var/www/letotechnics.ru;

	index index.php index.html index.htm index.nginx-debian.html;

	server_name letotechnics.ru;

error_log /var/logs/letotechnics.error.log error;

	location / {
		try_files $uri $uri/ =404;
	}

	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
	}

	location ~ /\.ht {
		deny all;
	}

    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/letotechnics.ru/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/letotechnics.ru/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = letotechnics.ru) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	listen 80;
	listen [::]:80;

	server_name letotechnics.ru;
    return 404; # managed by Certbot


}
