# CI-CD Deploy in kubernetes otus learning cluster

### Requirements:
* CI-CD Variables:  
`KUBECONFIG` type file! See how to get them [here](https://cloud.yandex.ru/ru/docs/managed-kubernetes/operations/connect/create-static-conf)    


### Deploy:
* Create dns records for kibana
* Change values.yml (if needed, for kibana, elsaticsearch, fluentd)  
* Commit code to `master` branch  
* Deploy one by one: Elasticsearch, kibana, fluentd  
* View kibana dashboard by fqdn in the browser
### Destroy:
* Create branch `destroy` and run pipeline