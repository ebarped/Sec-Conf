FROM centos:7

LABEL maintainer="Eduardo Barajas <edubape@gmail.com>" 
LABEL version="1.0"

COPY config_files /config_files
COPY playbook.yml /playbook.yml

RUN	yum -y install ansible

RUN ansible-playbook playbook.yml

RUN rm /playbook.yml && \
	rm -R /config_files && \
	yum remove ansible -y && \
	yum autoremove -y && \
	yum clean all

EXPOSE 445

ENTRYPOINT ["/run-samba.sh"]

#CMD smbd -FS --no-process-group < /dev/null
