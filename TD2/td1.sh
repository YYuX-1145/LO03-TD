if [ ! -d ".poubelle" ];then
	mkdir .pobelle
fi
for item in "$@"; do
	base_name=$(basename "$item")
	d=$(date +%s)
	mv "$item" "./.poubelle/${base_name}_${d}"
done
for item in $(ls .pobelle); do
	base_name=$(basename "$item")
	d=$(echo "$base_name"| cut -d '_' -f2)
	dn=$(date +%s)
	if [ $((dn - d)) -gt 2592000 ];then
		rm -r ./.poubelle/$item
	fi
done
