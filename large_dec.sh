#!/bin/bash
openssl rsautl -decrypt -inkey /media/yas/7648-4668/Key/private_key.pem -in "pass.txt.ssl" -out "pass.txt"
if [ $? -ne 0 ];then
	echo "Private key missing"
else
	pass=`cat pass.txt`
	
	rm "pass.txt"
	for file in "$@";do
		if [[ "$file" != *.sh ]] && [[ "$file" != *.ssl ]];then
			openssl enc -aes-256-cbc -d -in "$file" -out "$file"".dec" -k "$pass"
			if [ $? -ne 0 ];then
				echo "Wrong pass"
				exit 1
			else
				rm "$file"
				rename 's/.enc.dec$//' "$file"".dec"
			fi
		fi
	done

	rm pass.txt.ssl
fi
