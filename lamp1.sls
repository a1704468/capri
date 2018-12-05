  GNU nano 2.9.3                                   lamp.sls                                              

apache2:
 pkg.installed

php:
 pkg.installed

libapache2-mod-php:
 pkg.installed

/var/www/html/index.html:
  file.managed:
    - source: salt://apache2/kotisivut.php

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load

/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://php/php7.2.conf

/etc/apache2/mods-enabled/php7.2.conf:
  file.symlink:
    - target: ../mods-available/php7.2.conf

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load
      - file: /etc/apache2/mods-available/php7.2.conf
      - file: /etc/apache2/mods-enabled/php7.2.conf

mariadb-client:
  pkg.installed

mariadb-server:
  pkg.installed
