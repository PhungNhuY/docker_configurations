FROM ubuntu

RUN apt-get update 
# install apache
RUN apt-get install -y apache2 apache2-utils
# install subversion
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libsvn-dev libapache2-mod-svn subversion-tools
RUN apt-get install -y subversion
RUN a2enmod dav dav_svn authz_svn rewrite headers expires
# zip, curl
RUN apt-get install -y zip
RUN apt-get install -y curl

RUN apt-get clean

# create file, folder
RUN mkdir /var/www/
RUN mkdir /var/www/svn/
RUN mkdir /var/www/svn/repositories/
RUN touch /var/www/svn/authz
RUN touch /var/www/svn/passwd
RUN chown -R root:www-data /var/www/svn/
RUN chmod -R 775 /var/www/svn/
RUN adduser root www-data
RUN adduser www-data www-data

# apache conf
RUN rm /etc/apache2/sites-enabled/000-default.conf
COPY --chown=www-data:www-data ./svn.conf /etc/apache2/sites-enabled/

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
