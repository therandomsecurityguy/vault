# vault
Alpine Linux container running Vault by HashiCorp

## HOW TO USE

Run ephemerally:

```bash
docker run -it -p 8200:8200 --hostname vault --name vault therandomsecurityguy/vault
```
Or with a given config:

```bash
docker run -it -p 8200:8200 --hostname vault --name vault \
    -v $PWD/samples/vault.hcl:/config/vault.hcl therandomsecurityguy/vault server --config=/config/vault.hcl
```

If you require SSL CA certificates, mount them from the host system to /etc/ssl/certs. For instance, when using CoreOS, add -v /usr/share/ca-certificates:/etc/ssl/certs:ro to your command.

## LICENSE
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
