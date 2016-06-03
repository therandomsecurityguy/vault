# Docker file to run Hashicorp Vault (vaultproject.io)

FROM alpine:latest
MAINTAINER Derek Chamorro <therandomsecurityguy@gmail.com>

ENV VERSION 0.5.3

ADD https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_linux_amd64.zip /tmp/
ADD https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_SHA256SUMS      /tmp/
ADD https://releases.hashicorp.com/vault/${VERSION}/vault_${VERSION}_SHA256SUMS.sig  /tmp/

WORKDIR /tmp/

RUN apk --update add --virtual verify gpgme \
 && gpg --keyserver pgp.mit.edu --recv-key 0x348FFC4C \
 && gpg --verify /tmp/vault_${VERSION}_SHA256SUMS.sig \
 && apk del verify \
 && cat vault_${VERSION}_SHA256SUMS | grep linux_amd64 | sha256sum -c \
 && unzip vault_${VERSION}_linux_amd64.zip \
 && mv vault /usr/local/bin/ \
 && rm -rf /tmp/* \
 && rm -rf /var/cache/apk/*

WORKDIR /

# Expose TCP listener port
EXPOSE 8200

ENTRYPOINT ["/usr/local/bin/vault"]
CMD ["version"]
