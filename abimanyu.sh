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
apt-get install nginx unzip php7.2-fpm lsb-release ca-certificates apt-transport-https software-properties-common apache2 libapache2-mod-php7.2 -y

# arjuna.it10.com pada nginx configuration
cat <<EOF > /etc/nginx/sites-available/arjuna.it10.com
server {
    listen 8002;
    listen [::]:8002;

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

# add conf.d configuration for arjuna.it10.com
cat <<EOF > /etc/nginx/conf.d/arjuna.it10.com.conf
server {
    listen 8002;
    listen [::]:8002;

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

# Membuat direktori untuk arjuna
mkdir -p /var/www/arjuna.it10.com

# Download resources
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=17tAM_XDKYWDvF-JJix1x7txvTBEax7vX' -O /tmp/arjuna_dist.zip

# Unzip file yang di download
unzip -o /tmp/arjuna_dist.zip -d /tmp

# Memindahkan ke path yang dipilih
mv /tmp/arjuna.yyy.com/* /var/www/arjuna.it10.com/ -f

# Menghapus konfigurasi default nginx
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default

# start apache2
service apache2 start

# Setup konfigurasi abimanyu.it10.com
echo '<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/abimanyu.it10
    ServerName abimanyu.it10.com
    ServerAlias www.abimanyu.it10.com
    
    <Directory /var/www/abimanyu.it10>
        Options +FollowSymLinks -Multiviews
        AllowOverride All
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>' > /etc/apache2/sites-available/abimanyu.it10.com.conf

# a2ensite abimanyu.it10.com
a2ensite abimanyu.it10.com

# membuat direktori untuk abimanyu.it10
mkdir -p /var/www/abimanyu.it10

# Download resources
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc' -O /tmp/abimanyu_dist.zip

# Mengunzip resources
unzip -o /tmp/abimanyu_dist.zip -d /tmp

# Memindahkan ke /var/www/abimanyu.it10
mv /tmp/abimanyu.yyy.com/* /var/www/abimanyu.it10/ -f

# Menambahkan .htaccess 
echo 'RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^index.php\/home$ /home [NC,L]' > /var/www/abimanyu.it10/.htaccess

# Setup konfigurasi untuk subdomain parikesit.abimanyu.it10.com
echo '<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/parikesit.abimanyu.it10
    ServerName parikesit.abimanyu.it10.com
    ServerAlias www.parikesit.abimanyu.it10.com

    <Directory /var/www/parikesit.abimanyu.it10>
        Options +FollowSymLinks -Multiviews
        AllowOverride All
    </Directory>

    Alias "/js" "/var/www/parikesit.abimanyu.it10/public/js"

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.it10.com.conf

# a2ensite parikesit.abimanyu.it10.com
a2ensite parikesit.abimanyu.it10.com

# Membuat direktori untuk parikesit.abimanyu.it10.com
mkdir -p /var/www/parikesit.abimanyu.it10

# Download resources
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS' -O /tmp/parikesit_dist.zip

# Mengunzip resources
unzip -o /tmp/parikesit_dist.zip -d /tmp

# Memindahkan resources ke /var/www/parikesit.abimanyu.it10
mv /tmp/parikesit.abimanyu.yyy.com/* /var/www/parikesit.abimanyu.it10/ -f

# Membuat dan menambahkan folder rahasia untuk parikesit.abimanyu.it10
mkdir -p /var/www/parikesit.abimanyu.it10/secret
echo "SECRET FILE!!!" > /var/www/parikesit.abimanyu.it10/secret/secret.txt
echo 'Options -Indexes' > /var/www/parikesit.abimanyu.it10/secret/.htaccess

# Mengkonfigurasikan page 403 dan 404 untuk parikesit.abimanyu.it10 di .htaccess
echo 'RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_URI} !^/public/images/abimanyu.png$
RewriteRule ^(.*)\.(jpg|jpeg|png|gif)$ /public/images/abimanyu.png [NC,L]

ErrorDocument 404 /error/404.html
ErrorDocument 403 /error/403.html' > /var/www/parikesit.abimanyu.it10/.htaccess

# a2ensite & a2enmod abimanyu.ip
a2ensite abimanyu.ip
a2enmod rewrite

# disable default apache2 configuration
a2dissite 000-default.conf

# restart apache2
service apache2 restart

# start php
service php7.2-fpm start

# restart nginx
service nginx restart
