#!/bin/bash
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
                                                                                
