#!/usr/bin/env bash

cat > vault-server.hcl <<EOF
disable_mlock = true
ui            = true

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = "true"
}

storage "raft" {
  path = "/opt/vault"
  node_id = "node 2"
}

retry_join {
     auto_join = "provider=aws region=eu-north-1 tag_key=vault tag_value=server"
     auto_join_scheme = "http"
}

seal "gcpckms" {
   credentials = "cred.json"
   project     = "my-project-1234-285014"
   region      = "global"
   key_ring    = "catalina"
   crypto_key  = "vault"
}

api_addr = "http://172.31.16.107:8200"

cluster_addr = "http://173.31.16.107:8201"
EOF

sudo mkdir /etc/vault.d
sudo cp vault-server.hcl /etc/vault.d/vault.hcl

sudo mkdir -p /opt/vault

#Create Vault data directories
sudo mkdir -p /var/lib/vault/data


#create user named vault

sudo useradd --system --home /etc/vault.d --shell /bin/false vault
sudo chown -R vault:vault /etc/vault.d /var/lib/vault /opt/vault

#sudo chown vault:vault /etc/vault.d/vault.hcl
sudo chmod 640 /etc/vault.d/vault.hcl
sudo chmod -R 744 /opt/vault


sudo curl -o /etc/systemd/system/vault.service https://raw.githubusercontent.com/catalinaorg/vaultservice/main/vault.service

sudo systemctl enable vault.service
sudo systemctl start vault.service


