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
apt-get install nginx unzip php7.2-fpm lsb-release ca-certificates apt-transport-https software-properties-common -y

# arjuna.it10.com pada nginx configuration
cat <<EOF > /etc/nginx/sites-available/arjuna.it10.com
server {
    listen 8001;
    listen [::]:8001;

    root /var/www/arjuna.it10.com;
    index index.php index.html index.htm index.nginx-debian.html;

    server_name arjuna.it10.com;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;

        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

# Simpan pada symlink 
ln -s /etc/nginx/sites-available/arjuna.it10.com /etc/nginx/sites-enabled/arjuna.it10.com

# Membuat direktori untuk arjuna
mkdir -p /var/www/arjuna.it10.com

# Download resources
wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=17tAM_XDKYWDvF-JJix1x7txvTBEax7vX' -O /tmp/dist.zip

# Unzip file yang di download
unzip /tmp/dist.zip -d /tmp

# Memindahkan ke path yang dipilih
mv /tmp/arjuna.yyy.com/index.php /var/www/arjuna.it10.com/index.php

# Memulai php
service php7.2-fpm start

# Restart nginx
service nginx restart
