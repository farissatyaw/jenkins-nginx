FROM nginx
RUN apt-get update
run apt-get install -y sshpass
RUN apt-get install -y openssh-client openssh-server
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'root:password' | chpasswd

CMD service ssh start && nginx -g 'daemon off;'


EXPOSE 22
