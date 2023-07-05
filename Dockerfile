FROM ubuntu
LABEL MAINTAINER="dwtaylornz@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install php8.1
RUN sed -i 's/variables_order = "GPCS"/variables_order = "EGPCS"/' /etc/php/8.1/cli/php.ini

ADD init.sh fronius.php /

CMD ["bash","/init.sh"]