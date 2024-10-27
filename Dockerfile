FROM alpine:latest
LABEL MAINTAINER="dwtaylornz@gmail.com"

RUN apk --no-cache add jq curl tzdata

ADD init.sh /

CMD ["sh", "/init.sh"]