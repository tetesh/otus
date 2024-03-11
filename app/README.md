# CI-CD Deploy in kubernetes otus learning cluster

### Requirements:
* CI-CD Variables (in projiect, or group):  
`KUBECONFIG` type file!  
See how to get them [here](https://cloud.yandex.ru/ru/docs/managed-kubernetes/operations/connect/create-static-conf)  


### Deploy:
* Create dns records for app  
* Change values.yml (if needed: frontend.ingress_fqdn, etc..)  
* Commit code to `master` branch
* View app by fqdn in the browser (frontend.ingress_fqdn)

### Destroy:
* Create branch `destroy` and run pipeline