#!/bin/bash

#check if files in the the folder are already encrypted. 
#if pass.txt.ssl file present close the program

if [ -f "pass.txt.ssl" ];then
	echo "pass.txt.ssl file present."
	echo "Do not remove this file otherwise files cannot be decrypted using this password."
	exit 1
fi

#get random password value
echo "Generating 64 charactor password..."
pass=`openssl rand -base64 64`

#save the password in a temp file
echo "$pass"> pass.txt

#encrypt the password containing file
echo "Encrypting the password file..."
openssl rsautl -encrypt -inkey /home/yas/PublicKey/public_key.pem -pubin -in "pass.txt" -out "pass.txt"".ssl"

#if the public key is missing
if [ $? -ne 0 ];then
	rm "pass.txt"
	echo "Public key missing"
else
	rm "pass.txt"
	
	#for all the selected files
	for file in "$@";do
		#avoiding encrypting the program files, password containing file and encrypted files. 
		if [[ "$file" != *.sh ]] && [[ "$file" != *.ssl ]] && [[ "$file" != *.enc ]];then
	
			#encrypting
			echo "$file"" encrypting..."
			openssl enc -aes-256-cbc -salt -in "$file" -out "$file"".enc" -k "$pass"
		
			#if there is an error while encrypting do not remove the oiginal file
			#if the file is not present.
			if [ $? -ne 0 ]; then 
				echo "Error!"
			else
				rm "$file"
				echo "done."
			fi
		fi
	done
	#if no files are encrypted it is safe to delete the pass.txt.ssl file
fi
