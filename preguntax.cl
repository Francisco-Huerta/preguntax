server {
    listen 80;
    listen [::]:80;

    server_name  preguntax.cl www.preguntax.cl;
    root   /var/www/html/preguntax.cl;
    index  index.php;

    include snippets/well-known;

    access_log /var/log/nginx/preguntax.cl.access.log;
    error_log /var/log/nginx/preguntax.cl.error.log;

    client_max_body_size 100M;

    autoindex off;

    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    location ~ .php$ {
         include snippets/fastcgi-php.conf;
         fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
         include fastcgi_params;
    }
}
