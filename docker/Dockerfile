FROM tensorflow/tensorflow:latest-gpu

ARG user_id
ARG root_psw="12345678"
ARG user_psw="ok"
ARG user_name=user

# Installs the necessary pkgs.
RUN \
	echo "**** packages installation ****" \
		&& apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/3bf863cc.pub \
		&& apt-get update && apt-get install -y \
			vim \
			git \
            cmake \
            build-essential \
			virtualenv \
			time \
			sudo \
			wget \
			nano \
            imagemagick \
            python3-venv \
	&& echo "**** python pip update ****" \
		&& /usr/bin/python3 -m pip install --upgrade pip \
	&& echo "**** aliases for l and ll commands creation ****" \
		&& echo -e 'ls --color=auto "$@"' > /usr/bin/l \
		&& echo -e 'ls -lah --color=auto "$@"' > /usr/bin/ll \
    	&& chmod +x /usr/bin/ll /usr/bin/l \
	&& echo "**** history-search-backward by pressing F8 ****" \
		&& sed -i 's/# "\\e\[5~": history-search-backward/"\\e\[19~": history-search-backward/' /etc/inputrc \
	&& echo "**** root password creation ****" \
		&& echo "root:${root_psw}" | chpasswd \
	&& echo "**** user creation ****" \
		&& useradd -m -s /usr/bin/bash -u ${user_id} -G sudo ${user_name} \
		&& echo "${user_name}:${user_psw}" | chpasswd \
		&& chown -R ${user_name}:${user_name} /home/${user_name}/ \
		&& mkdir /home/${user_name}/workspace/ \
        && chown -R user:user /home/${user_name}/workspace

#Fix(?) Unexpected error from cudaGetDeviceCount(). Did you run some cuda functions before calling NumCudaDevices() that might have already set an error? Error 34: CUDA driver is a stub library
#RUN rm -rf /usr/local/cuda/lib64/stubs
#RUN sudo apt install -y nvidia-cuda-toolkit

USER ${user_name} 
WORKDIR /home/${user_name}/
 
RUN cd /home/${user_name}/workspace && git clone https://github.com/AmmarkoV/stable-diffusion && cd stable-diffusion && ./initialize.sh

