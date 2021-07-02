# How to use this repo:

- download script:

`curl -o ~/sc.sh https://raw.githubusercontent.com/catalinaorg/vaultservice/main/sc.sh`

Note:  Ip addresses `api_addr` and `cluster_addr` need to be adjusted depending where the script will be run.


- give permission to script to execute:

`chmod +x sc.sh`

- run script

`./sc.sh`


systemctl status vault.service
● vault.service - "HashiCorp Vault - A tool for managing secrets"
   Loaded: loaded (/etc/systemd/system/vault.service; enabled; vendor preset: enabled)
   Active: failed (Result: exit-code) since Fri 2021-07-02 08:07:06 UTC; 6min ago
     Docs: https://www.vaultproject.io/docs/
  Process: 15633 ExecStart=/usr/local/bin/vault server -config=/etc/vault.d/vault.hcl (code=exited, status=1/FAILURE)
 Main PID: 15633 (code=exited, status=1/FAILURE)

Jul 02 08:07:06 ip-10-0-1-254 systemd[1]: vault.service: Service hold-off time over, scheduling restart.
Jul 02 08:07:06 ip-10-0-1-254 systemd[1]: vault.service: Scheduled restart job, restart counter is at 3.
Jul 02 08:07:06 ip-10-0-1-254 systemd[1]: Stopped "HashiCorp Vault - A tool for managing secrets".
Jul 02 08:07:06 ip-10-0-1-254 systemd[1]: vault.service: Start request repeated too quickly.
Jul 02 08:07:06 ip-10-0-1-254 systemd[1]: vault.service: Failed with result 'exit-code'.
Jul 02 08:07:06 ip-10-0-1-254 systemd[1]: Failed to start "HashiCorp Vault - A tool for managing secrets".


Troubleshooting

`sudo -u vault /usr/local/bin/vault server -config=/etc/vault.d/vault.hcl`



