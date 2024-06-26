FROM php:8.2-apache             
# Enabling custom upload settings in PHP                                                                                                                            
RUN touch /usr/local/etc/php/conf.d/uploads.ini \                                                                                                           
&& echo "file_uploads = On" >> /usr/local/etc/php/conf.d/uploads.ini \
&& echo "memory_limit = 64M" >> /usr/local/etc/php/conf.d/uploads.ini \
&& echo "upload_max_filesize = 64M" >> /usr/local/etc/php/conf.d/uploads.ini \
&& echo "post_max_size = 64M" >> /usr/local/etc/php/conf.d/uploads.ini \
&& echo "max_execution_time = 60" >> /usr/local/etc/php/conf.d/uploads.ini
# Adding required libraries and modules
RUN apt-get update \
&& apt-get install -y git curl libxml2-dev libonig-dev libzip-dev
RUN docker-php-ext-install mysqli mbstring xml zip
# Copy proper file to target image
RUN cd /var/www/html && rm -rf *
WORKDIR /var/www/html
RUN git clone https://github.com/wavelog/Wavelog.git
RUN mv ./Wavelog/* ./ && rm -rf ./Wavelog
# Setting permissions as: https://github.com/wavelog/Wavelog/wiki/Installation
RUN cd /var/www/html \
&& chown -R root:www-data /var/www/html
RUN chmod -R g+rw ./application/config/ \
&& chmod -R g+rw ./application/logs/ \
&& chmod -R g+rw ./assets/qslcard/ \
&& chmod -R g+rw ./backup/ \
&& chmod -R g+rw ./updates/ \
&& chmod -R g+rw ./uploads/ \
&& chmod -R g+rw ./images/eqsl_card_images/ \
&& chmod -R g+rw ./assets/json/ \
&& chmod -R 777 /var/www/html/install
