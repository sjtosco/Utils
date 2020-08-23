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


Other alternative:

> WEB: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1854896/comments/16


Follow this steps, it works for me:

1. Run
    $ sudo -H gedit /etc/default/grub

In the open window edit line

    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

it should look this way

    GRUB_CMDLINE_LINUX_DEFAULT="quiet splash i8042.nopnp"

Save file and run

    $ sudo update-grub

2. Run
    $ echo "blacklist i2c_hid" | sudo tee /etc/modprobe.d/i2c-hid.conf
    $ sudo depmod -a
    $ sudo update-initramfs -u
    $ echo "synaptics_i2c" | sudo tee -a /etc/modules

3. Reboot.
