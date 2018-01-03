#!/usr/bin/env bash

function copy() {
    scp -3 -r rpgm@mensa.uberspace.de:/var/www/virtual/rpgm/wegbereiter_phpbb/$1 root@vps283316.ovh.net:/root/data/wegbereiter/forum/phpbb/phpbb/$2
}

#ssh uberspace 'mysqldump --user=rpgm --password=ilomyusFicdyetov --databases rpgm_wegbereiter_phpbb > /var/www/virtual/rpgm/wegbereiter_phpbb/dump.sql' \

copy images/avatars/upload/. images/avatars/upload
copy files/. files/
copy store/. store/
#copy dump.sql dump.sql
