resource "google_compute_network_peering" "hub_to_fe" {
  name         = "hub-to-fe"
  network      = google_compute_network.vpc["gc-p-hub-vpc"].self_link
  peer_network = google_compute_network.vpc["gc-p-fe-vpc"].self_link
}

resource "google_compute_network_peering" "hub_to_be" {
  name         = "hub-to-be"
  network      = google_compute_network.vpc["gc-p-hub-vpc"].self_link
  peer_network = google_compute_network.vpc["gc-p-be-vpc"].self_link
}