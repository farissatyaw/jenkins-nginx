# jenkins-nginx
A Simple learning for jenkins and NGINX

To spin it up just do
```
docker-compose up -d --build
```
Then set up the jenkins job by creating the freestyle job, set up the git repository to this one and add execute shell
```
sshpass -p YOUR_PASSWORD_SET_IN_web/Dockerfile scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ./web/index.html root@jenkins_web_1:/usr/share/nginx/html/
```
