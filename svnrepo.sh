#!/bin/bash
svnadmin create /var/Repositories/$1
chown -R www-data:www-data /var/Repositories/$1
chmod -R 755 /var/Repositories/$1

echo " <Location /svn/$1>
        DAV svn
        SVNPath /var/Repositories/$1
        AuthType Basic
        AuthName "$1"
        AuthUserFile /etc/subversion/passwd
        Require valid-user
    </Location>
" >> /etc/apache2/sites-enabled/svnrepos.conf

apache2ctl restart

echo "$1 svn repository successfully created."

