# (My) Recommended GNS3 simulator on Debian 9


## Creating a python3 virtualenv

```bash
virtualenv venvGNS3 -p python3
source venvGN3/bin/activate
pip install gns3-server gns3-gui pyqt5
```

## Creating a launcher

Create a bash file and give execution permission: 
  *sudo vi /usr/local/bin/gns3 && sudo chmod +x /usr/local/bin/gns3*

```
#! /bin/bash
cd <venv directory>
source bin/activate
# virtualenv is now active.
#
bin/gns3 &

```

## And...

It's all. You can now from Terminal launch **gns3** or you can make a launcher from GUI (using alacarte or similar)

Regards!
