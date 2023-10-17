# Kelompok IT10 #

## Anggota: ##
1. Caroline Permatasari Pramestita G.K. (5027211048)
2. Vira Datry Maulydina (5027211050)

## Laporan Resmi Modul 2 ##
![dokumentasi-soalno1a](https://i.ibb.co/7RZJ57M/06.png)

## Soal No 1 ##
Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Kita membuat topologi yang sudah di tentukan pada modul dengan menambahkan fitur-fitur gambar pada gns3 setelah tersusun melakukan penyambungan agar Jalur pada jaringan yang harus dilewati paket-paket data untuk dapat masuk ke jaringan yang lain.

## Soal No 2 ##
Kita akan membuat domain  www.arjuna.yyy.com dengan yyy merupakan kode kelompok.

- Menginstall Dependencies untuk mengupdate daftar paket dan menginstal perangkat lunak pada bind.
```  
# Menginstall dependencies
apt-get update -y
apt-get install bind9 -y
```

- Selanjutnya kita membuat folder jarkom terlebih dahulu di dalam /etc/bind.
```
mkdir /etc/bind/jarkom
```
- Selanjutnya membuat perintah dengan configurasi domain, untuk membuat website utama yang kemudian nantinya akan dikonfigurasikan ke Arjuna. Lalu, nodes client Nakula yang akan mencoba mengakses ke website tersebut.
```
echo 'zone "arjuna.it10.com" {
  type master;
  notify yes;
  also-notify {192.238.1.5; };
  allow-transfer {192.238.1.5; };
  file "/etc/bind/jarkom/arjuna.it10.com";
};
```
- Copykan file db.local pada path  /etc/bind ke dalam folder jarkom yang sudah kita buat tadi.
```
cp /etc/bind/db.local /etc/bind/jarkom/arjuna.it10.com
```
- Kemudian buka file jarkom dan isikan program untuk menkonfigurasikan data bind yang digunakan untuk mengelola DNS server arjuna.
```
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.it10.com. root.arjuna.it10.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      arjuna.it10.com.
@       IN      A       192.238.2.2
www     IN      CNAME   arjuna.it10.com.' > /etc/bind/jarkom/arjuna.it10.com
```

- Lalu restart bin9, ini akan menghentikan layanan bind yang sedang berjalan, kemudian akan segera memulainya kembali perubahan konfigurasi pada server DNS.
```
service bind9 restart
```
- Jika sudah, lakukan ping arjuna.IT10.com -c pada nodes client Nakula.
<a href="https://ibb.co/r5F1Hjm"><img src="https://i.ibb.co/CVmTQcz/Modul2-Nomer-1.jpg" alt="Modul2-Nomer-1" border="0"></a>

## Soal No 3 ##
Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.

- Buatlah domain pada Yudhistira untuk abimanyu yang berisikan seperti dibawah.
```
echo 'zone "arjuna.it10.com" {
  type master;
  notify yes;
  also-notify {192.238.1.5; };
  allow-transfer {192.238.1.5; };
  file "/etc/bind/jarkom/arjuna.it10.com";
};

```
- Selanjutnya, lakukan cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.IT10.com. isikan program untuk menkonfigurasikan data bind yang digunakan untuk mengelola DNS server abimanyu.
```
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.it10.com. root.arjuna.it10.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      arjuna.it10.com.
@       IN      A       192.238.2.2
www     IN      CNAME   arjuna.it10.com.' > /etc/bind/jarkom/arjuna.it10.com

```
- Selanjutnya, pada nodes client Nakula melakukan nano /root/.bashrc dan isikan konfigurasi ip.
```
nameserver="192.168.122.1"
```
- Kemudian restart bind9 dengan perintah
```
service bind9 restart
```
- Selanjutnya, lakukan ping abimanyu.IT10.com -c pada nodes client Nakula. Jika berhasil, maka akan terlihat seperti gambar dibawah bahwa client Nakula telah berhasil connect ke host abimanyu.IT10.com.
<a href="https://ibb.co/bsfhrGC"><img src="https://i.ibb.co/R35nCJs/Modul2-Nomer-2.jpg" alt="Modul2-Nomer-2" border="0"></a>

## Soal No 4 ##
Disini karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.

- Buka /root/.bashrc pada Yudhistira dan tambahkan parikesit pada konfigurasi data ke bind untuk mengelola DNS servernya.
- Jika sudah lakukan restart bind9 dengan perintah
```
service bind9 restart
```
- Selanjutnya pada nodes client Nakula, lakukan ping parikesit.abimanyu.IT10.com -c.
<a href="https://ibb.co/bsfhrGC"><img src="https://i.ibb.co/R35nCJs/Modul2-Nomer-2.jpg" alt="Modul2-Nomer-2" border="0"></a>

## Soal No 5 ##
Buat juga reverse domain untuk domain utama. (Abimanyu saja yang direverse)

Edit file /etc/bind/named.conf.local pada Yudhistira. Lalu tambahkan konfigurasi berikut ke dalam file conf Tambahkan reverse dari 3 byte awal dari IP yang ingin dilakukan Reverse DNS.
```
zone "3.238.192.in-addr.arpa" {
  type master;
  file "/etc/bind/jarkom/3.238.192.in-addr.arpa";
};' > /etc/bind/named.conf.local
```
- Copykan file db.local pada path /etc/bind ke dalam folder jarkom yang baru saja dibuat cp /etc/bind/db.local. Edit file menjadi seperti dibawah.
```
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.it10.com. root.abimanyu.it10.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
3.238.192.in-addr.arpa  IN      NS      abimanyu.it10.com.
3                       IN      PTR     abimanyu.it10.com.' > /etc/bind/jarkom/3.238.192.in-addr.arpa
```
- Kemudian restart bind9 dengan perintah
```
service bind9 restart
```
- Lalu, pada client nodes Nakula untuk mengecek apakah konfigurasi sudah benar atau belum, lakukan perintah berikut
```
apt-get update
apt-get install dnsutils
```
- Jika berhasil maka akan terlihat seperti gambar dibawah ini
<a href="https://ibb.co/ZfMyWM2"><img src="https://i.ibb.co/BfC8qCn/Modul2-Nomer-5.jpg" alt="Modul2-Nomer-5" border="0"></a>

## Soal No 6 ##
Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.

- Edit file /etc/bind/named.conf.local dan sesuaikan dengan syntax berikut.
```
zone "abimanyu.it10.com" {
  type master;
  notifty yes;
  also-notify {192.238.1.5; };
  allow-transfer {192.238.1.5; };
  file "/etc/bind/jarkom/abimanyu.it10.com";
};
```
- Jika sudah, lakukan restart bind9
```
service bind9 restart
```
- lakukan update terlebih dahulu menggunakan apt-get update, Setalah melakukan update silahkan install aplikasi bind9 dengan perintah.
```
apt-get install bind9 -y
```
- Kemudian buka file /etc/bind/named.conf.local dan tambahkan syntax berikut.
```
zone "abimanyu.it10.com" {
    type slave;
    masters { 10.78.1.2; };
    file "/etc/bind/jarkom/abimanyu.it10.com";
};
```
- Lakukan ping pada client. Jika ping berhasil maka konfigurasi DNS slave telah berhasil seperti gambar dibawah.
<a href="https://ibb.co/8cbM9Gm"><img src="https://i.ibb.co/SrcNBH6/Modul2-Nomer-6-2.jpg" alt="Modul2-Nomer-6-2" border="0"></a>
- Selanjutnya, jika sudah berhasil lakukan stop pada server seperti pada gambar dibawah
<a href="https://ibb.co/stXwd1Q"><img src="https://i.ibb.co/0QzMR9Z/Modul2-Nomer-6-1.jpg" alt="Modul2-Nomer-6-1" border="0"></a>

## Soal No 7 ##
Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda.

- Edit file abimanyu.IT10.com menjadi seperti dibawah ini
```
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.it10.com. root.abimanyu.it10.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      abimanyu.it10.com.
@               IN      A       192.238.3.3
www             IN      CNAME   abimanyu.it10.com.
parikesit       IN      A       192.238.3.3
ns1             IN      A       192.238.1.5
baratayuda      IN      NS      ns1' > /etc/bind/jarkom/abimanyu.it10.com
```
- Kemudian restart bind9 dengan perintah
```
service bind9 restart
```
- Setelah menyelesaikan semua pada Yuhistira lalu bukalah Werkudara lalu edit file /etc/bind/named.conf.local dan tambahkan
```
zone "3.238.192.in-addr.arpa" {
  type master;
  file "/etc/bind/jarkom/3.238.192.in-addr.arpa";
};'
```
- lalu buat direktori baratayuda dengan mkdir /etc/bind/baratayuda. Copykan file db.local pada path /etc/bind ke dalam folder jarkom yang baru saja dibuat cp /etc/bind/db.local /etc/bind/jarkom/baratayuda/abimanyu.IT10.com. Lalu edit file seperti dibawah
```
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.it10.com. root.arjuna.it10.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      arjuna.it10.com.
@       IN      A       192.238.2.2
www     IN      CNAME   arjuna.it10.com.' > /etc/bind/jarkom/arjuna.it10.com

```
- Setelah itu restart kembali bind dengan perintah service bind9 restart
- Setelah restart bind9 untuk memastikan bahwa DNS SLAVE sudah berjalan matikan bind9 DNS MASTER dengan service bind9 stop lalu cek menggunakan ping
```
ping baratayuda.abimanyu.IT10.com
ping www.baratayuda.abimanyu.IT10.com
```
- Jika dia berhasil akan menampilkan hasil seperti pada gambar dibawah
<a href="https://ibb.co/VwyVJ0t"><img src="https://i.ibb.co/NThxtgs/Modul2-Nomer-7.jpg" alt="Modul2-Nomer-7" border="0"></a>


## Soal No 8 ##
Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu.

- edit file /etc/bind/jarkom/baratayuda/abimanyu.IT10.com pada Werkudara menjadi seperti dibawah ini
```
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     rjp.baratayuda.abimanyu.it10.com. root.rjp.baratayuda.abimanyu.it10.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@           IN      NS      rjp.baratayuda.abimanyu.it10.com.
@           IN      A       192.238.3.3
www         IN      CNAME   rjp.baratayuda.abimanyu.it10.com.' > /etc/bind/jarkom/baratayuda/rjp.baratayuda.abimanyu.it10.com
```
- Kemudian lakukan restart bind9 dengan perintah service bind9 restart
- Setelah restart bind9 untuk memastikan jika DNS SLAVE sudah berjalan matikan bind9 DNS MASTER dengan service bind9 stop lalu cek dengan perintah
```
ping rjp.baratayuda.abimanyu.IT16.com
```
- Jika dia berhasil akan muncul seperti pada gambar dibawah ini
<a href="https://ibb.co/mBB36fM"><img src="https://i.ibb.co/KGGJFT3/Modul2-Nomer-8.jpg" alt="Modul2-Nomer-8" border="0"></a>


## Soal No 9 ##
Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker (yang juga menggunakan nginx sebagai webserver) yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker.

- Membuat file /var/www/jarkom/index.php
```
<?php
echo "Hello World from prabukusuma";
?>
```
- Membuat konfigurasi /etc/nginx/sites-available/jarkom

```
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
```
- Kemudian jalankan command dengan perintah
```
server {
ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom

rm /etc/nginx/sites-enabled/default

service nginx restart

service php7.2-fpm start

service php7.2-fpm status
```
- jika berhasil dia akan memunculkan seperti pada gambar dibawah ini
<a href="https://ibb.co/445B5Sm"><img src="https://i.ibb.co/3SLtLFr/Modul2-Nomer-9-1.jpg" alt="Modul2-Nomer-9-1" border="0"></a>
- Selanjutnya Pada nodes Wisanggeni membuat file /var/www/jarkom/index.php
```
<?php
echo "Hello World from wisanggeni";
?>
```
- Setelah itu Membuat konfigurasi /etc/nginx/sites-available/jarkom
```
server {
    listen 8003;
    listen [::]:8003;

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
```
- Sama seperti tadi jalankan command terlebih dahulu dengan perintah

```
server {
ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom

rm /etc/nginx/sites-enabled/default

service nginx restart

service php7.2-fpm start

service php7.2-fpm status
```
- Selanjutkan jika sudah dijalankan akan muncul seperti pada gambar dibawah
src="https://i.ibb.co/7g7rnPB/Modul2-Nomer-9-3.jpg" alt="Modul2-Nomer-9-3" border="0"></a>

- Pada nodes Abimanyu membuat file /var/www/jarkom/index.php
```
<?php
echo "Hello World from prabukusuma";
?>
```
- Membuat konfigurasi /etc/nginx/sites-available/jarkom
```
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
```
- kemudian jalankan command
```
server {
ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled/jarkom

rm /etc/nginx/sites-enabled/default

service nginx restart

service php7.2-fpm start

service php7.2-fpm status
```
- jika berhasil akan muncul seperti dibawah ini

<a href="https://ibb.co/8mRQfDs"><img src="https://i.ibb.co/Bf7YQV3/Modul2-Nomer-9-2.jpg" alt="Modul2-Nomer-9-

## Soal No 10 ##
Kemudian gunakan algoritma Round Robin untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003.

- Pertama kita akan membuat konfigurasi pada node Arjuna untuk load balancer pada file /etc/nginx/sites-available/load-balancer

```
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
```
- Mejalankan command dan lakukan restrat nginx
```
 ln -s /etc/nginx/sites-available/load-balancer /etc/nginx/sites-enabled/load-balancer

service nginx restart
```
- Jika setelah direstrat dan sudah melakukan command akan muncul pada gambar dibawah
<a href="https://ibb.co/tXTHzzy"><img src="https://i.ibb.co/yScNppL/Modul2-Nomer-10.jpg" alt="Modul2-Nomer-10" border="0"></a>

## Soal No 11 ##
Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server www.abimanyu.yyy.com. Pertama dibutuhkan web server dengan DocumentRoot pada /var/www/abimanyu.yyy

- Pertama kita akan melakukan installasi apache
```
apt-get install apache2
service apache2 start
```
- kemudian pada /etc/apache2/sites-available/000-default.conf ditambahkan seperti dibawah ini.
```
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
```
- Jika sudah menambahkan, selanjutnya melakukan restart
```
apt-get install libapache2-mod-php7.0
service apache2 restart
```
- lakukan dilakukan testing pada client, seperti gambar dibawah ini jika berhasil.
<a href="https://ibb.co/QJFmhbK"><img src="https://i.ibb.co/grMgQjR/Modul2-Nomer-11.jpg" alt="Modul2-Nomer-11" border="0"></a>

## Soal No 12 ##
Setelah itu ubahlah agar url www.abimanyu.yyy.com/index.php/home menjadi www.abimanyu.yyy.com/home.

- tambahkan alias pada /etc/apache2/sites-available/000-default.conf sebagai berikut
```
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
```
- Jika sudah menambahkan alias, kemudian lakukan restart dengan perintah
```
service apache2 restart
```
- Setelah melakukan restrat kita akan menjalankan jika sudah bisa jalan maka akan terlihat seperti gambar dibawah ini
<a href="https://ibb.co/TcMgBQF"><img src="https://i.ibb.co/H7THDck/Modul2-Nomer-12.jpg" alt="Modul2-Nomer-12" border="0"></a>


## Soal No 13 ##
Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy

- Pertama kita melakukan pada /etc/apache2/sites-available/000-default.conf tambahkan konfigurasi sebagai berikut.
```
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
```
- kemudian restart apache terlebih dahulu dengan perintah dibawah
```
service apache2 restart
```
- untuk testing dapat dilakukan a2ensite parikesit.abimanyu.it10.com maka akan memunculkan hasil sesuai dengan gambar dibawah.
<a href="https://ibb.co/xYK1nTQ"><img src="https://i.ibb.co/LrDxT7f/Modul2-Nomer-13.jpg" alt="Modul2-Nomer-13" border="0"></a>

## Soal No 14 ##
Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).

- pada parikesit.abimanyu.it10.com di /etc/apache2/sites-available/000-default.conf dapat ditambahkan Deny From All sebagai berikut

```
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
	Deny From All
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.it10.com.conf
```
- Jika sudah ditambahkan bisa melakukan restart apache dengan perintah dibawah.
```
service apache2 restart
```
- Ketika sudah direstrat maka akan dilakukan testing pada client dengan perintah
```
a2ensite parikesit.abimanyu.it10.com
```
- Jika berhasil akan muncul seperti pada gambar dibawah ini
<a href="https://imgbb.com/"><img src="https://i.ibb.co/nR26X01/Modul2-Nomer-14.jpg" alt="Modul2-Nomer-14" border="0"></a>

## Soal No 15 ##
Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.

- pada parikesit.abimanyu.it10.com di /etc/apache2/sites-available/000-default.conf dapat ditambahkan jenis error dan path menuju file error kustomnya.
```
echo '<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/parikesit.abimanyu.it10
    ServerName parikesit.abimanyu.it10.com
    ServerAlias www.parikesit.abimanyu.it10.com

    <Directory /var/www/parikesit.abimanyu.it10>
        Options +FollowSymLinks -Multiviews
        AllowOverride All
		Options + Indexes
    </Directory>

    Alias "/js" "/var/www/parikesit.abimanyu.it10/public/js"

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>' > /etc/apache2/sites-available/parikesit.abimanyu.it10.com.conf
```
- Langkah selanjutnya mungkin bisa lakukan restart apache
```
service apache2 restart
```
- Selanjutkan lakukan testing jika berhasil dia akan memunculkan pada gambar dibawah ini
<a href="https://imgbb.com/"><img src="https://i.ibb.co/hyyrHLn/Modul2-Nomer-15.jpg" alt="Modul2-Nomer-15" border="0"></a>

## Soal No 16 ##
Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi 
www.parikesit.abimanyu.yyy.com/js 

- menambahkan alias pada parikesit.abimanyu.it10.com di /etc/apache2/sites-available/000-default.conf sebagai berikut.
```
VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/abimanyu.it10.com
        ServerName abimanyu.it10.com
        ServerAlias www.abimanyu.it10.com
        <Directory/var/www/abimanyu.it10.com/index.php/home>
                Options +Indexes
        </Directory>

        Alias"/home""/var/www/abimanyu.it10.com/index.php/home"

    ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined


</VirtualHost>

<Virtualhost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/parikesit.abimanyu.it10
        ServerName parikesit.abimanyu.it10.com
        ServerALiaswww.parikesit.abimanyu.it10.com
        <Directory /var/www/parikesit.abimanyu.it10/secret>
                Deny From All
        </Directory>
        Alias "/js" "/var/www/parikesit.abimanyu.it10/public/js"
        ErrorDocument403 /error/403.html
        ErrorDocument 404 /error/404.html
       ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined


</VirtualHost>
```
- kemudian lakukan restart pada apache
```
service apache2 restart
```
- kemudian untuk testing dapat dilakukan dengan lynx www.parikesit.abimanyu.it10.com/js diperoleh
<a href="https://ibb.co/ckYYh5v"><img src="https://i.ibb.co/bQbb5h3/Modul2-Nomer-16.jpg" alt="Modul2-Nomer-16" border="0"></a>

- jika berhasl akan menampilkan tampilan seperti pada gambar diatas.

## Soal No 17 ##
Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.

- Mungkin kita bisa tambahkan konfigurasi rjp.baratayuda.abimanyu.it10.com kedalam file /etc/apache2/sites-available/000-default.conf namun dengan port 14000 dan 14400.

```

VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/abimanyu.it10.com
        ServerName abimanyu.it10.com
        ServerAlias www.abimanyu.it10.com
        <Directory/var/www/abimanyu.it10.com/index.php/home>
                Options +Indexes
        </Directory>

        Alias"/home""/var/www/abimanyu.it10.com/index.php/home"

     ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined


</VirtualHost>

<Virtualhost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/parikesit.abimanyu.it10
        ServerName parikesit.abimanyu.it10.com
        ServerALiaswww.parikesit.abimanyu.it10.com
        <Directory /var/www/parikesit.abimanyu.it10/secret>
                Deny From All
        </Directory>
        Alias "/js" "/var/www/parikesit.abimanyu.it10/public/js"
        ErrorDocument403 /error/403.html
        ErrorDocument 404 /error/404.html
        ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined

</VirtualHost>

<VirtualHost *:14000 *:14400>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/rjp.baratayuda.abimanyu.it10
        ServerName rjp.baratayuda.abimanyu.it10.com
        ServerALias www.rjp.baratayuda.abimanyu.it10.com

    ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined

</VirtualHost>
```
- kemudian tambahkan port 14000 dan 14400 pada konfigurasi port /etc/apache2/ports.conf sebagai berikut
```
listen 80;
        listen [::]:80;

        server_name arjuna.it10.com;

        location / {
            proxy_pass http://nodes_lb;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

```
- Setelah itu lakukan restart apache
```
service apache2 restart
```
- setelah itu melakukan testing, untuk mengetahui program berjalan atau tidak jika berhasil dia akan memunculkan seperti pada gambar dibawah
<a href="https://ibb.co/j5WWnWB"><img src="https://i.ibb.co/7zRRsR8/Modul2-Nomer-17-18-2jpeg.jpg" alt="Modul2-Nomer-17-18-2jpeg" border="0"></a>

## Soal No 18 ##
Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.

- Yang pertama lakukan setting username dan password pada suatu folder
```
mkdir /etc/apache2/passwd
```
- kemudian pada rjp.baratayuda.abimanyu.it10.com di /etc/apache2/sites-available/000-default.conf ditambahkan sebagai berikut
```
VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/abimanyu.it10.com
        ServerName abimanyu.it10.com
        ServerAlias www.abimanyu.it10.com
        <Directory/var/www/abimanyu.it10.com/index.php/home>
                Options +Indexes
        </Directory>

        Alias"/home""/var/www/abimanyu.it10.com/index.php/home"

    ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined


</VirtualHost>

<Virtualhost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/parikesit.abimanyu.it10
        ServerName parikesit.abimanyu.it10.com
        ServerALiaswww.parikesit.abimanyu.it10.com
        <Directory /var/www/parikesit.abimanyu.it10/secret>
                Deny From All
        </Directory>
        Alias "/js" "/var/www/parikesit.abimanyu.it10/public/js"
        ErrorDocument403 /error/403.html
        ErrorDocument 404 /error/404.html
      ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined


</VirtualHost>

<VirtualHost *:14000 *:14400>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/rjp.baratayuda.abimanyu.it10
        ServerName rjp.baratayuda.abimanyu.it10.com
        ServerALias www.rjp.baratayuda.abimanyu.it10.com
        <Directory/var/www/rjp.baratayuda.abimanyu.it10>
                AuthType Basic
                AuthName "Restricted Files"
                # (Following line optional)
                AuthBasicProvider file
                AuthUserFile "/etc/apache2/passwd/password"
                Require user Wayang
        </Directory>
       ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined

</VirtualHost>
```
- Kemudian restrart apache
```
service apache2 restart
```
- sehingga jika dilakukan testing pada port 14000
```
lynx www.rjp.baratayuda.abimanyu.it10.com:14000
```
- Jika berhasil dia akan memunculkan hasil seperti gambar dibawah ini
<a href="https://ibb.co/c3563sg"><img src="https://i.ibb.co/qjGNj2y/Modul2-Nomer-17-18-1.jpg" alt="Modul2-Nomer-17-18-1" border="0"></a>

## Soal No 19 ##
Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com (alias)

- Pertama kita akan melakukan enable pada rewrite dengan
```
a2enmod rewrite
```
- pada abimanyu.it10.com di /etc/apache2/sites-available/000-default.conf dapat ditambahkan RewriteRule dan RewriteCond sebagai berikut.

```

VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/abimanyu.it10.com
        ServerName abimanyu.it10.com
        ServerAlias www.abimanyu.it10.com
        <Directory/var/www/abimanyu.it10.com/index.php/home>
                Options +Indexes
        </Directory>
        <Directory /var/www>
        RewriteEngine on
        RewriteCond %{HTTTP_HOST} ^10\.19\.3.4$
        RewriteRule /.* http://www.abimanyu.it10.com/index.php/home."
        </Directory>
        Alias"/home""/var/www/abimanyu.it10.com/index.php/home"

    ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined


</VirtualHost>

<Virtualhost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/parikesit.abimanyu.it10
        ServerName parikesit.abimanyu.it10.com
        ServerALiaswww.parikesit.abimanyu.it10.com
        <Directory /var/www/parikesit.abimanyu.it10/secret>
                Deny From All
        </Directory>
        Alias "/js" "/var/www/parikesit.abimanyu.it10/public/js"
        ErrorDocument403 /error/403.html
        ErrorDocument 404 /error/404.html
    ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined


</VirtualHost>

<VirtualHost *:14000 *:14400>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/rjp.baratayuda.abimanyu.it10
        ServerName rjp.baratayuda.abimanyu.it10.com
        ServerALias www.rjp.baratayuda.abimanyu.it10.com
        <Directory/var/www/rjp.baratayuda.abimanyu.it10>
                AuthType Basic
                AuthName "Restricted Files"
                # (Following line optional)
                AuthBasicProvider file
                AuthUserFile "/etc/apache2/passwd/password"
        </Directory>
           ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined

</VirtualHost>
```
- Selanjutkan bisa lakukan restart apache
```
service apache2 restart
```
- Langkah terakhir lakukan testing untuk mengetahui apakah program jalan atau tidak
```
lynx www.abimanyu.it10.com
```
- Jika sudah melakukan testing maka akan muncul seperti pada gambar dibawah
<a href="https://ibb.co/2PNqb6b"><img src="https://i.ibb.co/4MdWQfQ/Modul2-Nomer-19.jpg" alt="Modul2-Nomer-19" border="0"></a>

## Soal No 20 ##
Karena website www.parikesit.abimanyu.yyy.com semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.

- melakukan enable pada rewrite dengan
```
a2enmod rewrite
```
- pada parikesit.abimanyu.it10.com di /etc/apache2/sites-available/000-default.conf dapat ditambahkan redirect pada request yang memiliki kata abimanyu dan extension jpg atau png.
```
VirtualHost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/abimanyu.it10.com
        ServerName abimanyu.it10.com
        ServerAlias www.abimanyu.it10.com
        <Directory/var/www/abimanyu.it10.com/index.php/home>
                Options +Indexes
        </Directory>
        <Directory /var/www>
        RewriteEngine on
        RewriteRule ^public/images/abimanyu\.png$ - [L]
        RewriteCond %{REQUEST_URI} abimanyu
        RewriteRule \.(jpg|png)$ /public/images/abimanyu.png [R=301,L]
        </Directory>
        Alias"/home""/var/www/abimanyu.it10.com/index.php/home"

        ErrorLog $EAPACHE_LOG_DIR]/error.Log
        CustomLog $[APACHE_LOG_DIR]/access.log combined

</VirtualHost>

<Virtualhost *:80>

        ServerAdmin webmaster@localhost
        DocumentRoot/var/www/parikesit.abimanyu.it10
        ServerName parikesit.abimanyu.it10.com
        ServerALiaswww.parikesit.abimanyu.it10.com
        <Directory /var/www/parikesit.abimanyu.it10/secret>
                Deny From All
        </Directory>
        Alias "/js" "/var/www/parikesit.abimanyu.it10/public/js"
        ErrorDocument403 /error/403.html
        ErrorDocument 404 /error/404.html
        ErrorLog ${APACHE_LOG_DIR} /error. Log
        CustomLog ${APACHE_LOG_DIR}/access.Log combined

</VirtualHost>

<VirtualHost *:14000 *:14400>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/rjp.baratayuda.abimanyu.it10
        ServerName rjp.baratayuda.abimanyu.it10.com
        ServerALias www.rjp.baratayuda.abimanyu.it10.com
        <Directory/var/www/rjp.baratayuda.abimanyu.it10>
                AuthType Basic
                AuthName "Restricted Files"
                # (Following line optional)
                AuthBasicProvider file
                AuthUserFile "/etc/apache2/passwd/password"
                Require user Wayang
        </Directory>
        ErrorLog $EAPACHE._LOG_DIR /error.Log
        CustomLog $[APACHE_LOG_DIR]/access.log combined
</VirtualHost>
```
- kemudian setelah itu lakukan restart pada apache
```
service apache2 restart
```
- test dengan lynx www.parikesit.abimanyu.it10.com/public/images/uwogh.jpg
<a href="https://ibb.co/tBs7NQR"><img src="https://i.ibb.co/dB2d3jZ/Modul2-Nomer-20-1.jpg" alt="Modul2-Nomer-20-1" border="0"></a>
<a href="https://ibb.co/BtzsPL6"><img src="https://i.ibb.co/ZVLTJdg/Modul2-Nomer-20-2.jpg" alt="Modul2-Nomer-20-2" border="0"></a>

- jika berhasil dia akan memunculkan perintah yang ada pada gambar diatas.



