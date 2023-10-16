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
<a href="https://ibb.co/r5F1Hjm"><img src="https://i.ibb.co/CVmTQcz/Modul2-Nomer-1.jpg" alt="Modul2-Nomer-1" border="0"></a>

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







