#!/bin/bash
for file in ./*;
do
	if [ ! -d "$file" ]
	then
		if [[ "$file" != *.sh ]];
		then
			if [[ "$file" = *.ssl ]]
			then
				openssl rsautl -decrypt -inkey /media/yas/7648-4668/Key/private_key.pem -in "$file" -out "$file"".dec"
				if [ $? -ne 0 ];then
	                		echo "Error"
	                      	else
					rename 's/.ssl.dec$//' "$file"".dec"
					rm $file
					echo "done ""$file"
				fi
			fi
		fi
	fi
done
