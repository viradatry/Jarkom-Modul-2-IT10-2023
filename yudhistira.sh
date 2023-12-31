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
3.238.192.in-addr.arpa  IN      NS      abimanyu.it10.com.
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
