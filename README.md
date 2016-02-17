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
    -v $PWD/config/config.hcl:/config/config.hcl therandomsecurityguy/vault server --config=/config/config.hcl
```

## LICENSE
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
