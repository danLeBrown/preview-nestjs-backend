resource "digitalocean_droplet" "preview" {
    image = "ubuntu-25-10-x64"
    name = "preview"
    region = "nyc2"
    size = "s-1vcpu-1gb"
    ssh_keys = [
      data.digitalocean_ssh_key.terraform.id
    ]

    connection {
        host = self.ipv4_address
        user = "root"
        type = "ssh"
        private_key = file(var.pvt_key)
        timeout = "2m"
    }

  #   provisioner "remote-exec" {
  #       inline = [
  #       "export PATH=$PATH:/usr/bin",
  #       # install nginx
  #       "sudo apt update",
  #       "sudo apt install -y nginx"
  #       ]
  # }

  provisioner "local-exec" {
    command = "sleep 15 && ansible-playbook -i ${self.ipv4_address}, -u root --private-key=${var.pvt_key} setup_server.yaml"
  }
}
