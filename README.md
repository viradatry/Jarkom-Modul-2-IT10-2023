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
- Membuat perintah dengan configurasi domain sesuai syntax nama kelompok.
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
- Kemudian buka file jarkom dan edit dengan IP EniesLobby masing-masing kelompok.
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

## Soal No 3 ##
Memebuat website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.

- Pada client arahkan nameserver menuju IP dengan mengedit file resolv.conf dengan mengetikkan perintah.
```
nano /etc/resolv.conf
```
- menentukan server nama untuk akses internet
```
nameserver="192.168.122.1"
```
- Untuk mencoba koneksi DNS, lakukan ping terlebih dahulu untuk mengetahui server jalan atau tidak.

-


  








## Jawaban 
Nomer 2
<a href="https://ibb.co/r5F1Hjm"><img src="https://i.ibb.co/CVmTQcz/Modul2-Nomer-1.jpg" alt="Modul2-Nomer-1" border="0"></a>

Nomer 3
<a href="https://ibb.co/bsfhrGC"><img src="https://i.ibb.co/R35nCJs/Modul2-Nomer-2.jpg" alt="Modul2-Nomer-2" border="0"></a>

Nomer 4
<a href="https://ibb.co/XyYnhgy"><img src="https://i.ibb.co/s5WT0G5/Modul2-Nomer-3.jpg" alt="Modul2-Nomer-3" border="0"></a>

Nomer 5
<a href="https://ibb.co/ZfMyWM2"><img src="https://i.ibb.co/BfC8qCn/Modul2-Nomer-5.jpg" alt="Modul2-Nomer-5" border="0"></a>

Nomer 6
<a href="https://ibb.co/8cbM9Gm"><img src="https://i.ibb.co/SrcNBH6/Modul2-Nomer-6-2.jpg" alt="Modul2-Nomer-6-2" border="0"></a>
<a href="https://ibb.co/stXwd1Q"><img src="https://i.ibb.co/0QzMR9Z/Modul2-Nomer-6-1.jpg" alt="Modul2-Nomer-6-1" border="0"></a>

Nomer 7
<a href="https://ibb.co/VwyVJ0t"><img src="https://i.ibb.co/NThxtgs/Modul2-Nomer-7.jpg" alt="Modul2-Nomer-7" border="0"></a>

Nomer 8
<a href="https://ibb.co/mBB36fM"><img src="https://i.ibb.co/KGGJFT3/Modul2-Nomer-8.jpg" alt="Modul2-Nomer-8" border="0"></a>

Nomer 9
<a href="https://ibb.co/8mRQfDs"><img src="https://i.ibb.co/Bf7YQV3/Modul2-Nomer-9-2.jpg" alt="Modul2-Nomer-9-2" border="0"></a>
<a href="https://ibb.co/445B5Sm"><img src="https://i.ibb.co/3SLtLFr/Modul2-Nomer-9-1.jpg" alt="Modul2-Nomer-9-1" border="0"></a>
<a href="https://ibb.co/bHpNsTY"><img src="https://i.ibb.co/7g7rnPB/Modul2-Nomer-9-3.jpg" alt="Modul2-Nomer-9-3" border="0"></a>

Nomer 10
<a href="https://ibb.co/tXTHzzy"><img src="https://i.ibb.co/yScNppL/Modul2-Nomer-10.jpg" alt="Modul2-Nomer-10" border="0"></a>

Nomer 11
<a href="https://ibb.co/QJFmhbK"><img src="https://i.ibb.co/grMgQjR/Modul2-Nomer-11.jpg" alt="Modul2-Nomer-11" border="0"></a>

Nomer 12
<a href="https://ibb.co/TcMgBQF"><img src="https://i.ibb.co/H7THDck/Modul2-Nomer-12.jpg" alt="Modul2-Nomer-12" border="0"></a>

Nomer 13
<a href="https://ibb.co/xYK1nTQ"><img src="https://i.ibb.co/LrDxT7f/Modul2-Nomer-13.jpg" alt="Modul2-Nomer-13" border="0"></a>

Nomer 14
<a href="https://imgbb.com/"><img src="https://i.ibb.co/nR26X01/Modul2-Nomer-14.jpg" alt="Modul2-Nomer-14" border="0"></a>

Nomer 15
<a href="https://imgbb.com/"><img src="https://i.ibb.co/hyyrHLn/Modul2-Nomer-15.jpg" alt="Modul2-Nomer-15" border="0"></a>

Nomer 16
<a href="https://ibb.co/ckYYh5v"><img src="https://i.ibb.co/bQbb5h3/Modul2-Nomer-16.jpg" alt="Modul2-Nomer-16" border="0"></a>

Nomer 17 & 18
<a href="https://ibb.co/j5WWnWB"><img src="https://i.ibb.co/7zRRsR8/Modul2-Nomer-17-18-2jpeg.jpg" alt="Modul2-Nomer-17-18-2jpeg" border="0"></a>
<a href="https://ibb.co/c3563sg"><img src="https://i.ibb.co/qjGNj2y/Modul2-Nomer-17-18-1.jpg" alt="Modul2-Nomer-17-18-1" border="0"></a>

Nomer 19 
<a href="https://ibb.co/2PNqb6b"><img src="https://i.ibb.co/4MdWQfQ/Modul2-Nomer-19.jpg" alt="Modul2-Nomer-19" border="0"></a>

Nomer 20
<a href="https://ibb.co/tBs7NQR"><img src="https://i.ibb.co/dB2d3jZ/Modul2-Nomer-20-1.jpg" alt="Modul2-Nomer-20-1" border="0"></a>
<a href="https://ibb.co/BtzsPL6"><img src="https://i.ibb.co/ZVLTJdg/Modul2-Nomer-20-2.jpg" alt="Modul2-Nomer-20-2" border="0"></a>




## Source Code 

1. Nakula
```
# Set up nameserver
echo 'nameserver 192.238.1.4
nameserver 192.238.1.5
nameserver 192.168.122.1' > /etc/resolv.conf

# Menginstall dependencies
apt-get update -y
apt-get install dnsutils lynx -y
```

2. Sadewa
```
# Set up name server
echo 'nameserver 192.238.1.4
nameserver 192.238.1.5
nameserver 192.168.122.1' > /etc/resolv.conf

# Menginstall dependencies
apt-get update -y
apt-get install dnsutils lynx -y
```

3. Yudhistira
```
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
apt-get install bind9 -y

# Buat folder jarkom
mkdir /etc/bind/jarkom

# Edit named.conf.local 
echo 'zone "arjuna.it10.com" {
  type master;
  notify yes;
  also-notify {192.238.1.5; };
  allow-transfer {192.238.1.5; };
  file "/etc/bind/jarkom/arjuna.it10.com";
};

zone "abimanyu.it10.com" {
  type master;
  notifty yes;
  also-notify {192.238.1.5; };
  allow-transfer {192.238.1.5; };
  file "/etc/bind/jarkom/abimanyu.it10.com";
};

zone "3.238.192.in-addr.arpa" {
  type master;
  file "/etc/bind/jarkom/3.238.192.in-addr.arpa";
};' > /etc/bind/named.conf.local

# Menyalin file db.local (not sure)
cp /etc/bind/db.local /etc/bind/jarkom/arjuna.it10.com
cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.it10.com
cp /etc/bind/db.local /etc/bind/jarkom/3.238.192.in-addr.arpa

# Edit file /etc/bind/jarkom/arjuna.it10.com
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

# Edit file /etc/bind/jarkom/abimanyu.it10.com
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
@               IN      NS      abimanyu.it10.com.
@               IN      A       192.238.3.3
www             IN      CNAME   abimanyu.it10.com.
parikesit       IN      A       192.238.3.3
www.parikesit   IN      CNAME   parikesit.abimanyu.it10.com.
ns1             IN      A       192.238.1.5
baratayuda      IN      NS      ns1' > /etc/bind/jarkom/abimanyu.it10.com

# Edit file /etc/bind/jarkom/3.238.192.in-addr.arpa (reverse abimanyu)
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
@                       IN      NS      abimanyu.it10.com.
3                       IN      PTR     abimanyu.it10.com.' > /etc/bind/jarkom/3.238.192.in-addr.arpa

# Edit file /etc/bind/named.conf.options
cat <<EOF > /etc/bind/named.conf.options
options {
        directory "/var/cache/bind";

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0's placeholder.

        // forwarders {
        //      0.0.0.0;
        // };

        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
        # dnssec-validation auto;
        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
EOF

# restart bind9 
service bind9 restart
```

4. Werkudara
```
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
apt-get install bind9 -y

# Membuat direktori 
mkdir /etc/bind/jarkom
mkdir /etc/bind/jarkom/baratayuda

# Edit named.conf.local
echo 'zone "arjuna.it10.com" {
    type slave;
    masters { 10.78.1.2; };
    file "/etc/bind/jarkom/arjuna.it10.com";
};

zone "abimanyu.it10.com" {
    type slave;
    masters { 10.78.1.2; };
    file "/etc/bind/jarkom/abimanyu.it10.com";
};

zone "baratayuda.abimanyu.it10.com" {
    type master;
    file "/etc/bind/jarkom/baratayuda/baratayuda.abimanyu.it10.com";
};

zone "rjp.baratayuda.abimanyu.it10.com" {
    type master;
    file "/etc/bind/jarkom/baratayuda/rjp.baratayuda.abimanyu.it10.com";
};' > /etc/bind/named.conf.local

# Edit file /etc/bind/jarkom/arjuna.it10.com
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

# Edit file /etc/bind/jarkom/abimanyu.it10.com
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
@           IN      NS      abimanyu.it10.com.
@           IN      A       192.238.3.3
www         IN      CNAME   abimanyu.it10.com.' > /etc/bind/jarkom/abimanyu.it10.com

# Edit file /etc/bind/jarkom/baratayuda.abimanyu.it10.com
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.it10.com. root.baratayuda.abimanyu.it10.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@           IN      NS      baratayuda.abimanyu.it10.com.
@           IN      A       192.238.3.3
www         IN      CNAME   baratayuda.abimanyu.it10.com.' > /etc/bind/jarkom/baratayuda/baratayuda.abimanyu.it10.com

# Edit file /etc/bind/jarkom/rjp.baratayuda.abimanyu.it10.com
echo ';
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

# Edit file /etc/bind/named.conf.options
cat <<EOF > /etc/bind/named.conf.options
options {
        directory "/var/cache/bind";

        // If there is a firewall between you and nameservers you want
        // to talk to, you may need to fix the firewall to allow multiple
        // ports to talk.  See http://www.kb.cert.org/vuls/id/800113

        // If your ISP provided one or more IP addresses for stable
        // nameservers, you probably want to use them as forwarders.
        // Uncomment the following block, and insert the addresses replacing
        // the all-0's placeholder.

        // forwarders {
        //      0.0.0.0;
        // };

        //========================================================================
        // If BIND logs error messages about the root key being expired,
        // you will need to update your keys.  See https://www.isc.org/bind-keys
        //========================================================================
        # dnssec-validation auto;
        allow-query{any;};

        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
EOF

# restart bind9
service bind9 restart
```

5. Arjuna
```
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
```

6. Prabukusuma
```
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

# Membuat konfigurasi untuk arjuna.it10.com
cat <<EOF > /etc/nginx/conf.d/arjuna.it10.com.conf
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
```

7. Abimanyu
```
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

# Setup konfigurasi untuk subdomain rjp.abimanyu.it10.com
echo '<VirtualHost *:14000 *:14400>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/rjp.baratayuda.abimanyu.it10
    ServerName rjp.baratayuda.abimanyu.it10.com
    ServerAlias www.rjp.baratayuda.abimanyu.it10.com

    <Directory /var/www/rjp.baratayuda.abimanyu.it10>
        Options +FollowSymLinks -Multiviews
        AllowOverride All
        AuthType Basic
        AuthName "Restricted Content"
        AuthUserFile /var/www/rjp.baratayuda.abimanyu.it10/.htpasswd
        Require valid-user
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>' > /etc/apache2/sites-available/rjp.baratayuda.abimanyu.it10.com.conf

# a2ensite rjp.baratayuda.abimanyu.it10.com
a2ensite rjp.baratayuda.abimanyu.it10.com

# Membuat direktori untuk rjp.abimanyu.it10.com
mkdir -p /var/www/rjp.baratayuda.abimanyu.it10

# Download resources
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1pPSP7yIR05JhSFG67RVzgkb-VcW9vQO6' -O /tmp/rjp.baratayuda_dist.zip

# Mengunzip resources
unzip -o /tmp/rjp.baratayuda_dist.zip -d /tmp

# Memindahkan resources ke /var/www/rjp.abimanyu.it10
mv /tmp/rjp.baratayuda.abimanyu.yyy.com/* /var/www/rjp.baratayuda.abimanyu.it10/ -f

# Menambahkan .htpasswd funtukor rjp.baratayuda.abimanyu.it10
htpasswd -b -c /var/www/rjp.baratayuda.abimanyu.it10/.htpasswd Wayang baratayudait10

# Mengupdate /etc/apache2/ports.conf
echo '# If you just change the port or add more ports here, you will likely also
# have to change the VirtualHost statement in
# /etc/apache2/sites-enabled/000-default.conf

Listen 80
Listen 14000
Listen 14400

<IfModule ssl_module>
        Listen 443
</IfModule>

<IfModule mod_gnutls.c>
        Listen 443
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet' > /etc/apache2/ports.conf

#Menambahkan konfigurasi redirect untuk IP abimanyu
echo '<VirtualHost *:80>
    ServerName 192.238.3.3
    Redirect permanent / http://abimanyu.it10.com
</VirtualHost>' > /etc/apache2/sites-available/abimanyu.ip.conf

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
```

8. Wisanggeni 
```
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
EOF

# Simpan pada symlink 
ln -s /etc/nginx/sites-available/arjuna.it10.com /etc/nginx/sites-enabled/arjuna.it10.com

# Menambahkan konfigurasi untuk arjuna.it10.com
cat <<EOF > /etc/nginx/conf.d/arjuna.it10.com.conf
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
EOF

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
```

List IP :  

Nakula 192.238.1.2
Sadewa 192.238.1.3
Yudhistira 192.238.1.4
Werkudara 192.238.1.5

Arjuna 192.238.2.2

Prabukusuma 192.238.3.2
Abimanyu 192.238.3.3
Wisanggeni 192.238.3.4
