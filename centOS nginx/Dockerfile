FROM centos:7

LABEL maintainer="Eduardo Barajas <edubape@gmail.com>" 
LABEL version="1.0"

COPY config_files /config_files
COPY playbook.yml /playbook.yml

RUN	yum -y install ansible

RUN ansible-playbook playbook.yml

RUN rm /playbook.yml && \
	yum -y remove ansible && \
	yum autoremove -y && \
	yum clean all

EXPOSE 80 443

USER nginx

ENTRYPOINT ["/run-nginx.sh"]

#CMD nginx -g 'daemon off;'
