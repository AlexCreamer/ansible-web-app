
while true; do
  read -p "Configure RedHat/CentOS to autostart dhcp networking: <Yes, no>" autostart_dhcp

  case $autostart_dhcp in
    ""|Yes|yes|Y|y) chmod 755 net-autostart;
      sudo cp net-autostart /etc/init.d/;
      chkconfig --add net-autostart;
      sudo dhclient;
      break;;
    No|no|N|n) echo "Skipping dhcp setup";
      break;;
    *) echo "Inproper input";
  esac
done


sudo dnf update -y

#sudo dnf install python3 -y
#sudo dnf install python3-pip -y
#pip3 install ansible --user

sudo dnf makecache

sudo dnf install epel-release -y

sudo dnf makecache
sudo dnf install ansible -y
sudo dnf install python3-PyMySQL -y
echo "Run part 2 after reboot"
sudo reboot
