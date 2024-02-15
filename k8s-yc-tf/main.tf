module "kube" {
  source = "./tf-yc-k8s-module"

  network_id = yandex_vpc_network.vpc_otus.id

  master_locations = [
    {
      zone      = yandex_vpc_subnet.otus_k8s_subnet.zone
      subnet_id = yandex_vpc_subnet.otus_k8s_subnet.id
    }
  ]

  master_maintenance_windows = [
    {
      day        = "monday"
      start_time = "20:00"
      duration   = "3h"
    }
  ]

  node_groups = {
    "yc-k8s-ng-01" = {
      description = "Kubernetes otus nodes group 01"
      fixed_scale = {
        size = 2
      }
    }
  }
}
