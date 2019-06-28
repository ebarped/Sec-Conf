FROM centos:7

LABEL maintainer="Eduardo Barajas <edubape@gmail.com>" 
LABEL version="1.0"

COPY config_files /config_files
COPY playbook.yml /playbook.yml

RUN yum install ansible -y

RUN ansible-playbook playbook.yml

RUN rm /playbook.yml && \
	rm -R /config_files && \
	rm -R /owasp-modsecurity-crs-3.2-dev && \
	yum remove ansible -y && \
	yum autoremove -y && \
	yum clean all

EXPOSE 80 443

USER apache

ENTRYPOINT ["/run-httpd.sh"]

#CMD httpd -DFOREGROUND

