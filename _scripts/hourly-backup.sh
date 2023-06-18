#!/bin/bash

bpath="/backup_new"

db_name=''
db_login=''
db_pass=''

db_name2=''
db_login2=''
db_pass2=''


[ ! -d "$bpath/day" ] \
	&& mkdir -p "${bpath}/day"
[ ! -d "$bpath/week" ] \
	&& mkdir -p "${bpath}/week"
[ ! -d "$bpath/month" ] \
	&& mkdir -p "${bpath}/month"
[ ! -d "$bpath/year" ] \
	&& mkdir -p "${bpath}/year"


year=`date +"%Y"`
month=`date +"%m"`
day=`date +"%d"`
time=`date +"%H-00"`

date="${year}-${month}-${day}"
tmp_short="b_${date}_${time}"
tmp_full="${bpath}/${tmp_short}"

mkdir -p "$tmp_full"


mysqldump -u "$db_login" -p"$db_pass"  --databases "$db_name" \
	> "${tmp_full}/bu_${db_name}__${date}_${time}.sql"

mysqldump -u "$db_login2" -p"$db_pass2"  --databases "$db_name2" \
	> "${tmp_full}/bu_${db_name2}__${date}_${time}.sql"


archive="${tmp_full}.tar.gz"
cd "$bpath"
tar -czf "$archive" "$tmp_short"


ln "$archive" "${bpath}/day/"

if [ "$time" == "00-00" ]
then
	ln "$archive" "${bpath}/week/"

	if [ "$day" == "01" ]
	then
		ln "$archive" "${bpath}/month/"

		if [ "$month" == "01" ]
		then
			ln "$archive" "${bpath}/year/"
		fi
	fi
fi

if [ "$time" == "02-00" ]
then
	scp -rp \
		-i ~/.ssh/backup+ \
		"$archive" \
		'backup@<backup.DOMAIN.TLD>:/b_incoming/'
fi


rm $archive
rm -rf "$tmp_full"

find ${bpath}/day/* -mtime +1 -exec rm {} \;
find ${bpath}/week/* -mtime +7 -exec rm {} \;
find ${bpath}/month/* -mtime +365 -exec rm {} \;
