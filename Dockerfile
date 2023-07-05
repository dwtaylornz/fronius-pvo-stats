FROM ubuntu
LABEL MAINTAINER="dwtaylornz@gmail.com"

RUN apt-get update && apt-get -y install jq curl tzdata

ADD init.sh /

CMD ["bash","/init.sh"]