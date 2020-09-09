FROM ubuntu:20.04
LABEL maintainer="encry1024@gmail.com"
RUN sed -i -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list
RUN apt update -y && apt upgrade -y && apt install git pcregrep libpcre++-dev python-dev curl gcc -y
RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install pycrypto yara-python distorm3
WORKDIR /root
RUN git clone https://github.com/volatilityfoundation/volatility.git
# Installing MalConfScan
RUN git clone https://github.com/JPCERTCC/MalConfScan.git && pip install -r MalConfScan/requirements.txt
RUN cp -R MalConfScan/malconfscan.py MalConfScan/utils/ MalConfScan/yara/ volatility/volatility/plugins/malware
WORKDIR /root/volatility
ENTRYPOINT ["/bin/bash"]