FROM alpine:3.6
RUN apk -v --update add python py-pip groff less mailcap gettext && \
    apk add --virtual build_deps libintl && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic && \
    mv /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
