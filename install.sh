clear
echo '  _                       _           _ __  __ _             '
echo ' (_)                     (_)         | |  \/  (_)            '
echo '  _ _ __ ___   __ _  __ _ _  ___ __ _| | \  / |_ _ __   ___  '
echo ' | | '_ ` _ \ / _` |/ _` | |/ __/ _` | | |\/| | | '_ \ / _ \ '
echo ' | | | | | | | (_| | (_| | | (_| (_| | | |  | | | | | |  __/ '
echo ' |_|_| |_| |_|\__,_|\__, |_|\___\__,_|_|_|  |_|_|_| |_|\___| '
echo '                     __/ |                                   '
echo '                    |___/                                    '                              


sleep 2

echo "system> Choose which PHP binary you want to install"
echo "system>	1) Linux x86"
echo "system>	2) Linux x64"
echo -n "system> Number (e.g. 1): "
read a

case "$a" in 
	1 ) z="PHP_7.0.2_x86_Linux.tar.gz";;
	2 ) z="PHP_7.0.2_x86-64_Linux.tar.gz";;
	* ) z="x";;
esac

l="install_log/log"
le="install_log/log_errors"
lp="install_log/log_php"
lpe="install_log/log_php_errors"
w="install_log/log_wget"
wp="install_log/log_wget_php"

if [ $z == "x" ];then
	echo "error> Unknown selection. Restart the script, and then choose again."
	exit 1
else
	mkdir install_log
	echo "system> Installing ImagicalMine..."
	wget https://github.com/ImagicalMine/ImagicalMine/archive/master.zip >>./$w 2>>./$w
	chmod 777 master.zip >>./$l 2>>./$le
	unzip -o master.zip >>./$l 2>>./$le
	chmod 777 ImagicalMine-master >>./$l 2>>./$le
	cd ImagicalMine-master >>./$l 2>>./$le
	chmod 777 src >>../$l 2>>../$le
	cp -rf src .. >>../$l 2>>../$le
	cd .. >>../$l 2>>../$le
	rm -rf ImagicalMine-master >>./$l 2>>./$le
	rm -rf master.zip >>./$l 2>>./$le
	wget https://github.com/ImagicalMine/ImagicalMine/master/start.sh >>./$l 2>>./$le
	chmod 777 start.sh >>./$l 2>>./$le
	echo
	
	echo 'system> Installing PHP binary...'
	wget https://bintray.com/artifact/download/pocketmine/PocketMine/$z >>./$wp 2>>./$wp
	chmod 777 $z >>./$lp 2>>./$lpe
	tar zxvf $z >>./$lp 2>>./$lpe
	rm -r $z >>./$lp 2>>./$lpe
	echo
	echo "system> ImagicalMine installation completed! Run ./start.sh (or ./st*) to start ImagicalMine."
fi
