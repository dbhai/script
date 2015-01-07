#!/bin/bash
svnadmin dump /var/Repositories/$1 | gzip -9 > /var/samba/share/$1.dump.gz
rm -rf /var/Repositories/$1
echo "sed -i '/'$1'/,+7d' 000-default.conf"
cp /etc/apache2/sites-enabled/svnrepos.conf /etc/apache2/sites-enabled/svnrepos.conf-$(date +%Y-%m-%d).bak
sed '/'$1'/,+7d' /etc/apache2/sites-enabled/svnrepos.conf
apache2ctl restart
echo "$1 has been deleted."
