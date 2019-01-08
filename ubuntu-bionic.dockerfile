FROM tozd/runit:ubuntu-bionic

EXPOSE 80/tcp

ENV SET_REAL_IP_FROM=

VOLUME /etc/nginx/sites-volume
VOLUME /var/log/nginx

RUN apt-get update -q -q && \
 apt-get --yes --force-yes install language-pack-en-base software-properties-common && \
 LC_ALL=en_US.UTF-8 add-apt-repository --yes ppa:nginx/stable && \
 apt-get update -q -q && \
 apt-get --no-install-recommends --yes --force-yes install nginx-full && \
 echo "daemon off;" >> /etc/nginx/nginx.conf && \
 sed -i 's/\/\$nginx_version//' /etc/nginx/fastcgi_params && \
 echo 'fastcgi_param SCRIPT_FILENAME $request_filename;' >> /etc/nginx/fastcgi_params

RUN apt-get update -q -q && \
 apt-get --yes install vim multitail less ranger zsh

RUN \
 sed "51i\  prompt_adam2_color5=${5:-'red'}  # >,!, or #" /usr/share/zsh/functions/Prompts/prompt_adam2_setup > /tmp/prompt && \
 sed -i 's/{white}/{$prompt_adam2_color5}/g' /tmp/prompt && \
 mv /tmp/prompt /usr/share/zsh/functions/Prompts/prompt_adam2_setup

COPY ./etc /etc
COPY ./home /root
COPY ./home/prompt_adam2_setup /usr/share/zsh/functions/Prompts/prompt_adam2_setup
