FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y gnupg2 software-properties-common
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main" | tee /etc/apt/sources.list.d/ansible.list
RUN echo "deb-src http://ppa.launchpad.net/ansible/ansible/ubuntu bionic main" | tee -a /etc/apt/sources.list.d/ansible.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7BB9C367
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN apt-get install -y ansible
RUN apt-get install -y python-pip
RUN pip install --upgrade pycrypto pywinrm
RUN apt-get install -y sshpass openssh-client
RUN rm -rf /var/lib/apt/lists/*  /etc/apt/sources.list.d/ansible.list
RUN echo 'localhost' > /etc/ansible/hosts

CMD [ "ansible-playbook", "--version" ]
