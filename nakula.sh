# Set up nameserver
echo 'nameserver 192.238.1.4
nameserver 192.238.1.5
nameserver 192.168.122.1' > /etc/resolv.conf

# Menginstall dependencies
apt-get update -y
apt-get install dnsutils lynx -y
