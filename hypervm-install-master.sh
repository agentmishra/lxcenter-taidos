#!/bin/sh

if ! [ -f /usr/bin/yum ] ; then
      echo You at least need yum installed for this to work...
	  echo Please contact our support personnel Or visit the website at http://github.com/taidos
	  echo "                                "
	  exit
fi

if [ -f /usr/bin/yum ] ; then
	yum -y install php wget zip unzip 
else 
	up2date --nox --nosig php wget zip unzip
fi

if ! [ -f /usr/bin/php ] ; then
	echo installing php failed. Please fix yum/up2date.
	exit
fi

rm -f program-install.zip
wget https://github.com/taidos/lxcenter-repo/raw/master/program-install.zip


export PATH=/usr/sbin:/sbin:$PATH
unzip -oq program-install.zip
cd program-install/hypervm-linux
php ~/program-install/lxins.php --install-type=master $* | tee hypervm_install.log
