length=$1
shift
file_path="test"
while read line;do
	for word in $line;do
		if [ $length -eq ${#word} ];then
			is=1
			for rule in "$@";do			
				tar=${rule:0:1}
				pos=$((${rule:1}-1))				
				if [ ${word:$pos:1} != "$tar" ];then
					is=0
					break
				fi
			done
			if [ $is -eq 1 ];then
				echo $word
			fi
		fi
	done
done < $file_path
