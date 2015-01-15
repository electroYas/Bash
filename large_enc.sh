#!/bin/bash
pass=`openssl rand -base64 64`
echo "$pass"> pass.txt
openssl rsautl -encrypt -inkey /home/yas/PublicKey/public_key.pem -pubin -in "pass.txt" -out "pass.txt"".ssl"
if [ $? -ne 0 ];then
	rm "pass.txt"
	echo "Public key missing"
else
	rm "pass.txt"
	for file in "$@";do
	if [[ "$file" != *.sh ]];then
		openssl enc -aes-256-cbc -salt -in "$file" -out "$file"".enc" -k "$pass"
		if [ $? -ne 0 ]; then 
			echo "Error"
		else
			echo "done."
			rm "$file"
		fi
	fi
	done
fi
