# define the nameserver for internet access
nameserver="192.168.122.1"

# Menambahkan nameserver pada resolv.conf
if [ -f /etc/resolv.conf ]; then
    if ! grep -q "nameserver $nameserver" /etc/resolv.conf; then
        echo "nameserver $nameserver" | tee -a /etc/resolv.conf > /dev/null
    fi
fi

# Menginstall dependencies
apt-get update -y
apt-get install nginx -y

# Konfigurasi untuk arjuna.it10.com
echo 'http {
    upstream nodes_lb {
        server 192.238.3.2:8001;
        server 192.238.3.3:8002;
        server 192.238.3.4:8003;
    }
}

server {
    listen 80;
    listen [::]:80;

    server_name arjuna.it10.com;

    location / {
        proxy_pass http://nodes_lb;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}' > /etc/nginx/sites-available/default

# Edit configurasi untuk nginx
echo 'user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
    worker_connections 768;
    # multi_accept on;
}

http {
    upstream nodes_lb {
        server 192.238.3.2:8001;
        server 192.238.3.3:8002;
        server 192.238.3.4:8003;
    }

    server {
        listen 80;
        listen [::]:80;

        server_name arjuna.it10.com;

        location / {
            proxy_pass http://nodes_lb;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
    }
}' > /etc/nginx/nginx.conf

# Simpan pada symlink 
ln -s /etc/nginx/sites-available/arjuna.it10.com /etc/nginx/sites-enabled/arjuna.it10.com

# Restart nginx
service nginx restart
