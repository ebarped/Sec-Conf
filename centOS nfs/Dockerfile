FROM centos:7

LABEL maintainer="Eduardo Barajas <edubape@gmail.com>" 
LABEL version="1.0"

COPY config_files /config_files
COPY playbook.yml /playbook.yml

RUN	yum -y install ansible

RUN ansible-playbook playbook.yml

RUN rm /playbook.yml && \
	yum -y remove ansible && \
	yum clean all

EXPOSE 2049/tcp 1234/tcp

ENTRYPOINT ["/run-nfs.sh"]
