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
