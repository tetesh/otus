resource "yandex_vpc_gateway" "nat_gateway" {
  folder_id      = data.yandex_client_config.client.folder_id
  name = "vpc-otus-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "rt" {
  folder_id      = data.yandex_client_config.client.folder_id
  name       = "otus-route-table"
  network_id = yandex_vpc_network.vpc_otus.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}