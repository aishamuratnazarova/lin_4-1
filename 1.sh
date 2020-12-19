#!/bin/bash

#1.
mkdir test

#2.
ls -lAR /etc > ~/test/list

#3.
find /etc -type d | wc -l >> /test/list
find /etc -type f -name “.*” | wc -l >> /test/list

#4.
mkdir ~/test/links

#5.
ln ~/test/list  ~/test/links/list_hlink  

#6.
ln -s ~/test/list  ~/test/links/list_slink

#7.
stat -c %h ~/test/links/list_hlink ~/test/list ~/test/links/list_slink


#8.
cat ~/test/list | wc -l >> ~/test/links/list_hlink 

#9.
cmp -s ~/test/links/list_hlink ~/test/links/list_slink && echo YES || echo NO

#10.
mv ~/test/list ~/test/list1

#11.
cmp -s ~/test/links/list_hlink ~/test/links/list_slink && echo YES || echo NO

#12.
ln ~/test/links  ~/links_hlink

#13.
find /etc -type f -name "*.conf" -exec basename {} \; > ~/list_conf

#14.
find /etc -type d -name "*.d" -exec basename {} \; > ~/list_d

#15.
cat ~/list_conf ~/list_d > ~/list_conf_d

#16.
mkdir ~/test/.sub

#17.
cp ~/list_conf_d ~/test/.sub

#18.
cp -b ~/list_conf_d ~/test/.sub

#19.
find ~/test -type f,d

#20.
man man > ~/man.txt

#21.
cd ~
split -b 1K man.txt splited_man_

#22.
mkdir ~/test/man.dir

#23.
mv -i ~/splited_man_* ~/test/man.dir

#24.
cat ~/test/man.dir/splited_man_* > ~/test/man.dir/man.txt

#25.
cmp -s ~/man.txt ~/test/man.dir/man.txt && echo YES || echo NO

#26.
echo "Hello!" > ~/new_man.txt
cat ~/man.txt >> ~/new_man.txt
echo "Byesweety" >> ~/new_man.txt
mv ~/new_man.txt ~/man.txt

#27.
diff -u ~/man.txt ~/test/man.dir/man.txt > ~/diff_file

#28.
mv ~/diff_file ~/test/man.dir

#29.
patch ~/test/man.dir/man.txt ~/test/man.dir/diff_file 

#30.
cmp -s ~/man.txt ~/test/man.dir/man.txt && echo YES || echo NO
