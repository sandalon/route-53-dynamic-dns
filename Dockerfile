FROM alpine

RUN apk --no-cache update && \
    apk add --no-cache bash bind-tools && \
    apk --no-cache add python py-pip py-setuptools ca-certificates curl groff less && \
    apk add dos2unix --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ --allow-untrusted && \
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/*

COPY update-route53.sh .
RUN dos2unix update-route53.sh
RUN chmod +x update-route53.sh

ADD crontab /etc/cron.d/update-route53
RUN dos2unix /etc/cron.d/update-route53
RUN chmod 0644 /etc/cron.d/update-route53
RUN /usr/bin/crontab /etc/cron.d/update-route53

COPY start.sh .
RUN dos2unix start.sh
RUN chmod +x start.sh

CMD ["./start.sh"]



#CMD ["crond", "-L 2", "-f"]

#CMD "./update-route53.sh"

# Required Environment Variables

# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY
# AWS_DEFAULT_REGION
# ZONE_ID
# RECORDSET