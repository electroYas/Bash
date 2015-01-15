#!/bin/bash
for file in ./*;
do
	if [ ! -d "$file" ]
	then
		if [[ "$file" != *.sh ]];
		then
			if [[ "$file" != *.ssl ]];
			then
				openssl rsautl -encrypt -inkey /home/yas/PublicKey/public_key.pem -pubin -in "$file" -out "$file"".ssl"
				if [ $? -ne 0 ];then
					echo "Error"
					rm "$file"".ssl"
				else
					rm "$file"
					echo "done ""$file"
				fi
			fi
		fi
	fi
done

