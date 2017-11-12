FROM alpine

RUN apk --no-cache update && \
    apk add --no-cache bash bind-tools && \
    apk --no-cache add python py-pip py-setuptools ca-certificates curl groff less && \
    apk add dos2unix --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

COPY update-route53.sh /etc/periodic/15min/update-route53
RUN dos2unix /etc/periodic/15min/update-route53
RUN chmod +x /etc/periodic/15min/update-route53

CMD ["crond", "-fS"]

# Required Environment Variables

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION
# ZONE_ID
# RECORDSET