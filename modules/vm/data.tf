data "vault_generic_secret" "ssh" {
  path = "roboshop-infra/ssh"
}

# resource "local_file" "ssh" {
#   content  = data.vault_generic_secret.ssh.data["password"]
#   filename = "/tmp/vault"
# }