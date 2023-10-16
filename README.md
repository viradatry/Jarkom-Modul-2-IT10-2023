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







