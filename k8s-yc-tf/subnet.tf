resource "yandex_vpc_subnet" "otus_k8s_subnet" {
 v4_cidr_blocks = ["10.100.200.0/24"]
 zone           = "ru-central1-a"
 network_id     = yandex_vpc_network.vpc_otus.id
}