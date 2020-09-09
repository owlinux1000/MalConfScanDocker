# MalConfScan on Docker

[MalConfScan](https://github.com/JPCERTCC/MalConfScan) is very useful tool that is extracting the configuration of malwares such as Emotet. You can easily use MalConfScan with Docker.

```
$ docker pull ghcr.io/owlinux1000/malconfscan:latest
$ docker run --rm -v $(pwd):/root/tmp -it ghcr.io/owlinux1000/malconfscan:latest
# For example 
root@hogehoge:~/volatility# python vol.py malconfscan -f /root/tmp/image.vmem --profile=Win10x64_18362 -p 4416
```
