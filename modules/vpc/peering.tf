resource "google_compute_network_peering" "hub_to_fe" {
  name         = "hub-to-fe"
  network      = google_compute_network.hub.self_link
  peer_network = google_compute_network.fe.self_link
}

resource "google_compute_network_peering" "hub_to_be" {
  name         = "hub-to-be"
  network      = google_compute_network.hub.self_link
  peer_network = google_compute_network.be.self_link
}
