# activar-enrutamiento.sh
# echo "1" > /proc/sys/net/ipv4/ip_forward

echo -n "Activando el ip_forward… "
echo 1 > /proc/sys/net/ipv4/ip_forward && echo "Hecho"

echo -n "Limpiando reglas… "
iptables -F
iptables -t nat -F
iptables -P FORWARD ACCEPT
echo "Comandos de limpieza ejecutados"


iptables -t nat -A POSTROUTING -s 192.168.5.0/24 -o enp0s3 -j MASQUERADE

echo "Permitiendo forward desde la red interna… "
iptables -A FORWARD -s 192.168.5.0/24 -i enp0s3 -j ACCEPT
iptables -A INPUT -s 192.168.5.0/24 -j ACCEPT
echo "Finalizado"


