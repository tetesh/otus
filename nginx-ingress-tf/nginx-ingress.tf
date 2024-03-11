resource "helm_release" "ingress-nginx" {
  provider         = helm
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = local.nginx_namespace
  version          = local.nginx_chart_version
  atomic           = true
  create_namespace = true
  max_history      = 5
  wait             = true

  set {
    name  = "controller.replicaCount"
    value = local.ingress_replicaCount
  }
  set {
    name  = "controller.service.externalTrafficPolicy"
    value = "Local"
  }
  set {
    name  = "controller.config.enable-real-ip"
    value = true
  }
  set {
    name  = "controller.metrics.enabled"
    value = true
  }
  set {
    name  = "controller.metrics.serviceMonitor.enabled"
    value = true
  }
  set {
    name  = "controller.metrics.serviceMonitor.additionalLabels.release"
    value = "kube-prometheus-stack"
  }
}
