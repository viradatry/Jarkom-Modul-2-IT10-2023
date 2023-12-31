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
