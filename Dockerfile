FROM debian:buster

RUN apt-get update \
        && apt-get install -y --no-install-recommends \
            autoconf \
            automake \
            bison \
            build-essential \
            ca-certificates \
            flex \
            gawk \
            gettext \
            git \
            gperf \
            libgmp3-dev \
            libmpc-dev \
            libmpfr-dev \
            libtool \
            pkg-config \
            sudo \
            texinfo \
            zlib1g-dev \
            wget \
            curl \
            netcat \
            cpio \
            vim \
            less \
            doxygen \
            autopoint \
            bc \
            expect \
            kmod \
            libid3tag0-dev \
            libltdl-dev \
            mc \
            nano \
            openssh-client \
            python \
            sshpass \
            telnet \
            tftpd-hpa \
            unzip \
            wget \
            zip \
            graphviz \
            libpcap0.8-dev \
            && rm -rf /var/lib/apt/lists/* 

RUN mkdir -p /opt/padavan && \ 
    cd /opt/padavan && \
    wget -O start.sh http://prometheus.freize.net/script/start-99.sh && \
    chmod +x start.sh

RUN echo '#!/bin/bash\n\
sed -i "s/# CONFIG_RT2880_FLASH_16M is not set/CONFIG_RT2880_FLASH_16M=y/" padavan-ng/trunk/configs/boards/NEXX/WT3020H/kernel-3.4.x.config\n\
sed -i "s/CONFIG_RT2880_FLASH_8M=y/# CONFIG_RT2880_FLASH_8M is not set/" padavan-ng/trunk/configs/boards/NEXX/WT3020H/kernel-3.4.x.config\n\
sed -i "s/770000/F10000/" padavan-ng/trunk/configs/boards/NEXX/WT3020H/partitions.config\n\
sed -i "s/7C0000/F60000/" padavan-ng/trunk/configs/boards/NEXX/WT3020H/partitions.config\n\
sed -i "s/#CONFIG_FIRMWARE_ENABLE_EXT3/CONFIG_FIRMWARE_ENABLE_EXT3/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n\
sed -i "s/#CONFIG_FIRMWARE_ENABLE_EXT2/CONFIG_FIRMWARE_ENABLE_EXT2/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n\
sed -i "s/#CONFIG_FIRMWARE_ENABLE_XFS/CONFIG_FIRMWARE_ENABLE_XFS/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n\
sed -i "s/#CONFIG_FIRMWARE_INCLUDE_NFSD/CONFIG_FIRMWARE_INCLUDE_NFSD/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n\
sed -i "s/#CONFIG_FIRMWARE_INCLUDE_HDPARM/CONFIG_FIRMWARE_INCLUDE_HDPARM/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n\
sed -i "s/#CONFIG_FIRMWARE_INCLUDE_MINIDLNA/CONFIG_FIRMWARE_INCLUDE_MINIDLNA/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n\
sed -i "s/#CONFIG_FIRMWARE_INCLUDE_FIREFLY/CONFIG_FIRMWARE_INCLUDE_FIREFLY/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n\
sed -i "s/#CONFIG_FIRMWARE_INCLUDE_FFMPEG_NEW/CONFIG_FIRMWARE_INCLUDE_FFMPEG_NEW/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n\
sed -i "s/#CONFIG_FIRMWARE_INCLUDE_TRANSMISSION/CONFIG_FIRMWARE_INCLUDE_TRANSMISSION/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n\
sed -i "s/#CONFIG_FIRMWARE_INCLUDE_TRANSMISSION_WEB_CONTROL/CONFIG_FIRMWARE_INCLUDE_TRANSMISSION_WEB_CONTROL/" padavan-ng/trunk/configs/templates/nexx/wt3020h.config\n'\
> /opt/padavan/patch_BS-U35WF.sh

RUN chmod +x /opt/padavan/patch_BS-U35WF.sh

WORKDIR /opt/padavan

CMD ["/bin/bash"]    
