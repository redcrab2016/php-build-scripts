# ImagicalMine Installation Script for Mac OS X and Linux(master-0.14)
#  _    _            _    _______ 
# | |  | |    /\    | |  |__   __|
# | |__| |   /  \   | |     | |   
# |  __  |  / /\ \  | |     | |   
# | |  | | / ____ \ | |____ | | _ 
# |_|  |_|/_/    \_\|______||_|(_)
# 
# This file is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
# Before you start doing anything, read the license for more detail into what you are allowed to do and not do.                             

function pause(){
   read -p "$*"
}
                                 
clear
 echo "  _                       _           _ __  __ _             "
 echo " (_)                     (_)         | |  \/  (_)            "
 echo "  _ _ __ ___   __ _  __ _ _  ___ __ _| | \  / |_ _ __   ___  "
 echo " | | '_ ` _ \ / _` |/ _` | |/ __/ _` | | |\/| | | '_ \ / _ \ "
 echo " | | | | | | | (_| | (_| | | (_| (_| | | |  | | | | | |  __/ "
 echo " |_|_| |_| |_|\__,_|\__, |_|\___\__,_|_|_|  |_|_|_| |_|\___| "
 echo "                     __/ |                                   "
 echo "                    |___/                                    "

shopt -s extglob
echo "system> Choose which PHP binary you want to install"
echo "system>	1) Linux x86(32-bit system)"
echo "system>	2) Linux x64(64-bit system)"
echo "system>   3) Mac x86(32-bit system)"
echo "system>   4) Mac x64(64-bit system)"
pause 'system> Number (e.g. 1): '
# sleep 5
read a

case "$a" in 
	1 ) z="PHP_7.0.2_x86_Linux.tar.gz";;
	2 ) z="PHP_7.0.2_x86-64_Linux.tar.gz";;
        3 ) z="PHP_7.0.2_x86_MacOS.tar.gz";;
        4 ) z="PHP_7.0.2_x86-64_MacOS.tar.gz";;
	!(1) ) z="x";;
        !(2) ) z="x";;
        !(3) ) z="x";;
        !(4) ) z="x";;
esac

l="install_log/log"
le="install_log/log_errors"
lp="install_log/log_php"
lpe="install_log/log_php_errors"
w="install_log/log_wget"
wp="install_log/log_wget_php"

if [ $z == "x" ];then
	echo "error> An unexpected error occurred - either a 5 second timeout or an unknown selection. Restart the script, and then choose again."
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
#        cp -rf start.sh .. >>./$l 2>>./$le
	cd .. >>../$l 2>>../$le
	rm -rf ImagicalMine-master >>./$l 2>>./$le
	rm -rf master.zip >>./$l 2>>./$le
	wget https://raw.githubusercontent.com/ImagicalMine/ImagicalMine/master/start.sh >>./$l 2>>./$le
	chmod 777 start.sh >>./$l 2>>./$le
        wget https://raw.githubusercontent.com/ImagicalMine/ImagicalMine/master/LICENSE.md >>./$l 2>>./$le
	echo
	
	echo "system> Installing PHP binary..."
	wget https://bintray.com/artifact/download/pocketmine/PocketMine/$z >>./$wp 2>>./$wp
	chmod 777 $z >>./$lp 2>>./$lpe
	tar zxvf $z >>./$lp 2>>./$lpe
	rm -r $z >>./$lp 2>>./$lpe
	echo
	echo "system> ImagicalMine installation completed! Run ./start.sh (or ./st*) to start ImagicalMine."
        shopt -u extglob
fi
