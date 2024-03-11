# CI-CD Deploy in kubernetes otus learning cluster

### Requirements:
* CI-CD Variables:  
`KUBECONFIG` type file!  
See how to get them [here](https://cloud.yandex.ru/ru/docs/managed-kubernetes/operations/connect/create-static-conf)  


### Deploy:
* Create dns records for prometheus, alermanager, grafana  
* Change values.yml (if needed: grafana.ingress.hosts, grafana.adminPassword, prometheus.ingress.hosts, alertmanager.ingress.hosts, storageClassName's, etc..)  
* Commit code to `master` branch
* View k8s dashboards by fqdn in the browser (grafana.ingress.hosts, prometheus.ingress.hosts, alertmanager.ingress.hosts)

### Destroy:
* Create branch `destroy` and run pipeline