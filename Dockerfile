#
# Dockerfile for privoxy
#
FROM alpine

EXPOSE 8118

RUN apk --no-cache --update add privoxy ca-certificates && \
    sed -i'' 's/127\.0\.0\.1:8118/0\.0\.0\.0:8118/' /etc/privoxy/config && \
    echo 'forward-socks5 / v2ray:1080 .' >> /etc/privoxy/config
RUN chown privoxy.privoxy /etc/privoxy/*
ENTRYPOINT ["privoxy"]
CMD ["--no-daemon","--user","privoxy","/etc/privoxy/config"]

