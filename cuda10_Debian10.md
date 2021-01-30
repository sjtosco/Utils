# Install Cuda 10 + Tensorflow-gpu on debian 10 buster

# Install new nvidia driver (for maximum compatibility on new Geforce boards)

Download .run from nvidia according your board. This is neccesary for very new boards. After log in alternative tty
(CTRL + ALT + F1) and do: `sudo service stop lightdm` (this is for xfce)

Some prerequisites are: `sudo apt install pkg-config libglvnd-dev`. Finally,

```bash
sudo ./NVIDIA-Linux-x86_64-440.44.run
```


If you don't need this, you cant install driver from repo using: 
```bash
sudo apt install nvidia-driver
```

# Install cuda 10.0 (Compatible with tensorflow)

Download from the deb (local) installer for CUDA 10.0 from the [Nvidia Site](https://developer.nvidia.com/cuda-10.0-download-archive?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1804&target_type=deblocal). 
You will also need to create a login to download cuDNN.

```bash
sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-10.0.130-410.48_1.0-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-10-0-local-nvjpeg-update-1_1.0-1_amd64.deb
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1704/x86_64/7fa2af80.pub
sudo apt update
sudo apt install cuda-libraries-10-0
sudo dpkg -i libcudnn7_7.6.5.32-1+cuda10.0_amd64.deb
```

# Install tensorflow and keras

In a virtualenv (it's a suggestion), do (for 1.15 version):
```bash
pip install tensorflow-gpu==1.15 keras
```

> based on: [https://elec-otago.blogspot.com/2019/05/installing-tensorflow-and-cuda-10-on.html](https://elec-otago.blogspot.com/2019/05/installing-tensorflow-and-cuda-10-on.html)


# Important notes

On GTX2070 and similars, there is some error about *cudnn7*. This error are about tf session configuration.
If use KERAS, this code is a workaround:
```python
import tensorflow as tf
import keras.backend.tensorflow_backend as ktf


def get_session(gpu_fraction=0.333):
    gpu_options = tf.GPUOptions(per_process_gpu_memory_fraction=gpu_fraction,
                                allow_growth=True)
    return tf.Session(config=tf.ConfigProto(gpu_options=gpu_options))


ktf.set_session(get_session())

```
> Based on [https://stackoverflow.com/questions/41762272/use-tensorflow-gpuoptions-within-keras-when-using-tensorflow-backend](https://stackoverflow.com/questions/41762272/use-tensorflow-gpuoptions-within-keras-when-using-tensorflow-backend)


# CUDA 10.1 for Linux mint 20

https://towardsdatascience.com/installing-tensorflow-gpu-in-ubuntu-20-04-4ee3ca4cb75d
