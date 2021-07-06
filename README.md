# How to use this repo:

- download script:

`$ curl -o ~/sc.sh https://raw.githubusercontent.com/catalinaorg/vaultservice/main/sc.sh`

Note:  Ip addresses `api_addr` and `cluster_addr` need to be adjusted depending where the script will be run.


- give permission to script to execute:

`$ chmod +x sc.sh`

- run script

`$ ./sc.sh`

Check if the vault service is running

```

$ sudo systemctl status vault.service
● vault.service - "HashiCorp Vault - A tool for managing secrets"
   Loaded: loaded (/etc/systemd/system/vault.service; enabled; vendor preset: enabled)
   Active: active (running) since Fri 2021-07-02 08:31:21 UTC; 3min 9s ago
     Docs: https://www.vaultproject.io/docs/
 Main PID: 15867 (vault)
    Tasks: 7 (limit: 4617)
   CGroup: /system.slice/vault.service
           └─15867 /usr/local/bin/vault server -config=/etc/vault.d/vault.hcl

Jul 02 08:31:22 ip-10-0-1-254 vault[15867]:                Log Level: info
Jul 02 08:31:22 ip-10-0-1-254 vault[15867]:                    Mlock: supported: true, enabled: false
Jul 02 08:31:22 ip-10-0-1-254 vault[15867]:            Recovery Mode: false
Jul 02 08:31:22 ip-10-0-1-254 vault[15867]:                  Storage: raft (HA available)
Jul 02 08:31:22 ip-10-0-1-254 vault[15867]:                  Version: Vault v1.7.0+ent
Jul 02 08:31:22 ip-10-0-1-254 vault[15867]:              Version Sha: f45845666b4e552bfc8ca775834a3ef6fc097fe0
Jul 02 08:31:22 ip-10-0-1-254 vault[15867]: ==> Vault server started! Log data will stream in below:
Jul 02 08:31:22 ip-10-0-1-254 vault[15867]: 2021-07-02T08:31:22.009Z [INFO]  proxy environment: http_proxy= https_proxy= no_proxy=
Jul 02 08:31:22 ip-10-0-1-254 vault[15867]: 2021-07-02T08:31:22.013Z [INFO]  replication.perf.logshipper: Initializing new log shipper: max_elements=16384 max_bytes=203235942
Jul 02 08:31:22 ip-10-0-1-254 vault[15867]: 2021-07-02T08:31:22.013Z [INFO]  replication.dr.logshipper: Initializing new log shipper: max_elements=16384 max_bytes=203235942

```

Restart vault service:
 
 $ sudo systemctl restart vault.service

Option:

 $ sudo systemctl stop vault.service
 
 $ sudo systemctl start vault.service

# Troubleshooting

```

$ systemctl status vault.service
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

```


`sudo -u vault /usr/local/bin/vault server -config=/etc/vault.d/vault.hcl`



