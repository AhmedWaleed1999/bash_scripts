shell script (with comments, and identations) to:
	1-Monitor every 1 min the system load.
	if there is high load (increases)
	2-Add the load , and date to a log file /var/log/systemLoad 
	3-write event to an event file /tmp/events
		Subject: Server <IP> load
		Body:
			Dear, 
				The system (hostname) runs with IP (IP) has a load of 
				1MIN load: <value>
				5MIN load: <value>
				15MIN load: <value>
			Thank you .
```
#this script tp monitor load avarage of cpu
IP=$(ip add | awk '(/inet /){print $2}')
LOAD_1MIN=$(uptime | awk '{print $8}')
LOAD_1MIN=${LOAD_1MIN:0:4}
LOAD_5MIN=$(uptime | awk '{print $9}')
LOAD_5MIN=${LOAD_5MIN:0:4}
LOAD_15MIN=$(uptime | awk '{print $10}')
LOAD_15MIN=${LOAD_15MIN:0:4}
INCREASED=$(echo "($LOAD_1MIN>$LOAD_5MIN) && ($LOAD_5MIN>$LOAD_15MIN)" | bc )
DATE=$(date)
CPU_LOAD=$(uptime | awk '{print $6, $7, $8, $9, $10}')

if [ ${INCREASED} ]
then
                echo "$DATE: HIGH $CPU_LOAD" >> /var/log/systemload

        echo "Subject: Server ${IP}  load
              Body:
                
                Dear, 
                        The system ${HOSTNAME} runs with IP ${IP} has a load of 
                        1MIN load: ${LOAD_1MIN}
                        5MIN load: ${LOAD_5MIN}
                        15MIN load: ${LOAD_15MIN}
                                                                                
```
