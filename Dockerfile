FROM alpine:3.13.5

ARG VERSION_TERRAFORM="0.15.3"

RUN apk -v --update add zip ca-certificates curl py-pip groff less mailcap gettext && \
    apk add --virtual build_deps libintl && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    curl https://releases.hashicorp.com/terraform/${VERSION_TERRAFORM}/terraform_${VERSION_TERRAFORM}_linux_amd64.zip -o /usr/local/bin/terraform.zip && \
    unzip /usr/local/bin/terraform.zip -d /usr/local/bin && \
    rm /usr/local/bin/terraform.zip && \
    mv /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps && \
    apk -v --purge del py-pip curl && \
    rm /var/cache/apk/*
