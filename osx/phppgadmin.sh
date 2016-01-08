#!/bin/sh

# make sure appropriate libs are installed
xcode-select --install

brew reinstall php56 --with-postgresql
brew install phppgadmin

# in /etc/apache2/httpd.conf
# LoadModule php5_module    /usr/local/opt/php56/libexec/apache2/libphp5.so

# in /private/etc/apache2/other/phpgdadmin.conf
  #LoadModule php5_module    /usr/local/opt/php56/libexec/apache2/libphp5.so
  #Alias /phppgadmin /usr/local/share/phppgadmin
  #<Directory /usr/local/share/phppgadmin/>
    #DirectoryIndex index.php
    #Options Indexes FollowSymLinks MultiViews
    #AllowOverride All
    #Require local
    #Order allow,deny
    #Allow from 127.0.0.0/255.0.0.0 ::1/128
  #</Directory>

sudo apachectl restart

open http://localhost/phppgadmin/
