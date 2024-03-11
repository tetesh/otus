locals {
########### INGRESS NGINX CHART ###########
    nginx_chart_version     = "4.10.0"
    nginx_namespace         = "nginx-ingress"
    ingress_replicaCount    = 2
}
