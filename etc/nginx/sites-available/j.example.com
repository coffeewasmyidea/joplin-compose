server {
	root /var/www/html;

	index index.html index.htm index.nginx-debian.html;
	server_name j.example.com; # managed by Certbot

	proxy_set_header       Host $http_host;
	proxy_set_header       X-Forwarded-For $remote_addr;
	proxy_set_header       X-Forwarded-Proto $scheme;

	charset utf-8;
	proxy_redirect     off;
	log_not_found      off;

	location / {
		proxy_pass http://127.0.0.1:22300/;
	}

	#location / {
	#	return 404;
	#}


	error_log /var/log/nginx/j.example.com/error.log;
	# access_log off;
	access_log /var/log/nginx/j.example.com/access.log;

        error_page 404 /custom_404.html;
        location = /custom_404.html {
                root /usr/share/nginx/html;
                internal;
        }

        error_page 500 502 503 504 /custom_50x.html;
        location = /custom_50x.html {
                root /usr/share/nginx/html;
                internal;
        }

    # listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/j.example.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/j.example.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = j.example.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


	listen 80 ;
	listen [::]:80 ;
    server_name j.example.com;
    return 404; # managed by Certbot


}
