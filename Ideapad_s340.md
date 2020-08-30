## Touchpad ELAN 

With this steps the problems if fixed (For now)

> WEB: https://askubuntu.com/questions/1220264/lenovo-ideapad-s145-touchpad-not-working/1266740#1266740

I had this same issue. The problem is with the kernel. The kernel hasn't detected the touch pad. Firstly edit the kernel boot parameters. This is what i did to solve it - EDIT: It is recommended to take a backup using cp /etc/default/grub /etc/default/grub.bak

    sudo nano /etc/default/grub
    Edit GRUB_CMDLINE_LINUX_DEFAULT to GRUB_CMDLINE_LINUX_DEFAULT="quiet i8042.nopnp=1 pci=nocrs" 
    Now save and exit.
    Run sudo update-grub

The next steps will be to patch the kernel

    Now run git clone https://github.com/pavlepiramida/elan_i2c_dkms.git
    After that install make and dkms, so run sudo apt install make dkms
    Now run cd elan_i2c_dkms
    After that run sudo dkms install .
    Finally, run reboot

Now, once you reboot, the touch pad should be working...

For install new kernel (5+ from backports) that enable Debian 10 support for new S340 Lenovo Laptop:
> WEB: https://unix.stackexchange.com/questions/545601/how-to-upgrade-the-debian-10-kernel-from-backports-without-recompiling-it-from-s

```
echo deb http://deb.debian.org/debian buster-backports main contrib non-free | sudo tee /etc/apt/sources.list.d/buster-backports.list
sudo apt update
sudo apt install -t buster-backports linux-image-amd64
sudo apt install -t buster-backports firmware-linux firmware-linux-nonfree firmware-realtek 
sudo reboot
```
After boot in new kernel...
```
sudo apt install linux-headers-$(uname -r)
```


Easy fix (kernel 5.4):
Add to grub
GRUB_CMDLINE_LINUX_DEFAULT="quiet pci=nocrs" 

Bios in Only UEFI and Secure Bott Disabled

## snd_hda_intel no response from codec

> Web: https://forums.linuxmint.com/viewtopic.php?t=306711&start=20

add to file */etc/modprobe.d/alsa-base.conf* this line: **options snd-hda-intel model=dual-codecs**


## Airplane Mode

Creates a file */usr/local/bin/airplanemode-toggle.sh* with this:
```bash
#/bin/bash

wifi="$(nmcli r wifi | awk 'FNR = 2 {print $1}')"
if [ "$wifi" == "enabled" ]; then
	/usr/sbin/rfkill block bluetooth;
	/usr/sbin/rfkill block wlan;
	/usr/bin/notify-send -t 2000 "Airplane mode ON";
else
	/usr/sbin/rfkill unblock bluetooth;
	/usr/sbin/rfkill unblock wlan;
	/usr/bin/notify-send -t 2000 "Airplane mode OFF"
fi
```
