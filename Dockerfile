FROM jenkins/jenkins:lts
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV CASC_JENKINS_CONFIG /var/jenkins_home/casc.yaml

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER root
RUN apt-get update
RUN apt-get install -y sshpass

RUN curl -o /tmp/filebeat_1.0.1_amd64.deb https://download.elastic.co/beats/filebeat/filebeat_1.0.1_amd64.deb && \
    dpkg -i /tmp/filebeat_1.0.1_amd64.deb &&  apt-get install

COPY ./filebeat.yml /etc/filebeat/filebeat.yml

COPY ["./entrypoint.sh", "/"]
 
RUN chmod +x /entrypoint.sh
 
ENTRYPOINT ["/bin/bash","-c","./entrypoint.sh"]

COPY casc.yaml /var/jenkins_home/casc.yaml
