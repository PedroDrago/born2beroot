architecture=$(uname -a)sd

cores=$(lscpu | awk '/Core\(s\) per socket:/ {print $4}')
threads=$(lscpu | awk '/Thread\(s\) per core:/ {print $4}')
sockets=$(lscpu | awk '/Socket\(s\):/ {print $2}')
vCPU=$(lscpu | awk '/^Core\(s\) per socket:/ { cores = $4 }
  		    /^Thread\(s\) per core:/ { threads = $4 }
  	            /^Socket\(s\):/ { sockets = $2 }
		    END { vcpu= (cores * threads) * sockets; printf "%i\n", vcpu}')

ram_total=$(free | awk '/Mem/ {printf "%i\n", $2 / 1024}')
ram_used=$(free | awk '/Mem/ {printf "%i\n",$3 / 1024}')
ram_percentage=$(free | awk '/Mem/ {printf "%.2f\n", $3 / $2 * 100}')
disk_total=$(df -m | awk 'NR>1 {sum += $2} END {printf "%i\n", sum / 1024}')
disk_usage=$(df -m | awk 'NR>1 {sum += $3} END {print sum}')
disk_percentage=$(df -m | awk 'NR>1 {sum1 += $3; sum2 += $2; div = sum1 / sum2} END {printf "%i\n", div * 100}')

CPU_percentage=$(vmstat 1 2 | awk 'NR == 3 {printf "%.1f", (100 - $15)}')

date=$(who -b | awk '{print $3, $4}')

tcp_connections=$(ss -at | grep ESTAB | wc -l)

active_users=$(users | wc -w)

IPv4=$(hostname -I)
MAC=$(ip addr | awk '/ether/ {print $2}')

sudo_count=$(cat /var/log/sudo/sudo.log | awk '/COMMAND/' | wc -l)

$(lsblk | awk 'NR>1 {print $6}' | grep lvm > lvm.txt)

echo \#Architecture: $architecture
echo \#CPU Physical: $cores
echo \#vCPU: $vCPU
echo \#Memory Usage: $ram_used/$ram_total\MB \($ram_percentage%\)
echo \#Disc Usage: $disk_usage/$disk_total\Gb \($disk_percentage%\)
echo \#CPU load: $CPU_percentage%
echo \#Last boot: $date
if [ $(wc -l < "lvm.txt") -eq 0 ]; then
    echo \#LVM use: no
else
    echo \#LVM use: yes
fi
echo \#Connections TCP : $tcp_connections ESTABLISHED
echo \#User log: $active_users
echo \#Network: IP $IPv4 \($MAC\)
echo \#Sudo : $sudo_count cmd
