# (My) Recommended GNS3 simulator on Debian 9

## Dependencies
sudo apt install qemu-kvm dynamips

## Installing using pip3

```bash
pip3 install gns3-server gns3-gui pyqt5
```

## Starting gns3server as service on startup

Download systemd file:

``` bash

cd /lib/systemd/system
sudo wget https://github.com/GNS3/gns3-server/blob/master/init/gns3.service.systemd
sudo mv gns3.service.systemd gns3.service
```
sudo chown root gns3.service

In the file, using text editor, change *gns3* by *root* (User)

Now enable service:
``` bash
sudo systemctl enable gns3.service
sudo systemctl start gns3.service
```
## And...

It's all. You can now from Terminal launch **gns3** or you can make a launcher from GUI (using alacarte or similar)
Logo can be downloaded from Internet ;-)

Regards!
