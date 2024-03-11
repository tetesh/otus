## Otus project work

## Deploy gitlab in docker-compose  
1. `cd gitlab`
2. `docker compose up -d`
3. Wait ~10 min (readiness can be checked `docker compose logs`)
4. Add DNS A record `gitlab.ldy68.ru` for you IP, or add record to /etc/hosts: `sudo bash -c "echo '127.0.0.1   gitlab.ldy68.ru' >> /etc/hosts"`
5. Get root password: `docker compose exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password`
6. Open [gitlab](http://gitlab.ldy68.ru)
   

## Deploy and register shared gitlab runner in docker:
1. `cd gitlab-runner-docker`
2. Change `registration_token` in `runner-register.sh` (You need to take it to the admin area gitlab, CI-CD -> Runners)
3. `docker compose up -d`
4. Readiness can be checked `docker compose logs` 
   
## Deploy k8s zonal cluster YC:
1. Create gitlab project and copy git url  
2. Add CI-CD Variables (read README.md in k8s-yc-tf)  
3. Push local gitlab-runner-docker to you gitlab  
```cd gitlab-runner-docker
git init --initial-branch=master
git remote add origin {git url}
git add .
git commit -m "Initial commit"
git push --set-upstream origin master
```
4. In the automatically launched pipeline, look at the plan, if everything suits you, run the manual job `terraform apply`
5. Read terraform output, you will need it to get kubeconfig
  
## Deploy nginx-ingress in a cluster using helm terraform provider:
1. Create gitlab project and copy git url  
2. Add CI-CD Variables (read README.md in nginx-ingress-tf)  
3. Push local nginx-ingress-tf to you gitlab  
```cd nginx-ingress-tf
git init --initial-branch=master
git remote add origin {git url}
git add .
git commit -m "Initial commit"
git push --set-upstream origin master
```
4. In the automatically launched pipeline, look at the plan, if everything suits you, run the manual job `terraform apply`

## Deploy kube-prometheus-stack in a cluster using helm docker image and scripts:
1. Create gitlab project and copy git url  
2. Add CI-CD Variables (read README.md in prometheus-stack)  
3. Push local prometheus-stack to you gitlab  
```cd prometheus-stack
git init --initial-branch=master
git remote add origin {git url}
git add .
git commit -m "Initial commit"
git push --set-upstream origin master
```
4. In the automatically launched pipeline, look at the plan, if everything suits you, run the manual job `deploy-main`  
For more details, see the project readme

## Deploy app in a cluster using helm docker image and scripts:
1. Create gitlab project and copy git url  
2. Add CI-CD Variables (read README.md in app)  
3. Push local app to you gitlab  
```cd app
git init --initial-branch=master
git remote add origin {git url}
git add .
git commit -m "Initial commit"
git push --set-upstream origin master
```
4. In the automatically launched pipeline, look at the plan, if everything suits you, run the manual job `deploy-main`  
For more details, see the project readme