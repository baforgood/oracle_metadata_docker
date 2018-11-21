# escape=`
FROM phusion/baseimage:0.11
# run my_init
CMD ["/sbin/my_init"]

LABEL maintainer="alexander.haug@advisori.de"

EXPOSE 8080
EXPOSE 11580

# unzip is needed to work with 
RUN apt-get update && apt-get install unzip

RUN mkdir /home/OMM/

COPY ./ /home/OMM/

RUN mkdir -p /etc/my_init.d

COPY run_omm.sh /etc/my_init.d/run_omm.sh

RUN chmod +x /etc/my_init.d/run_omm.sh

RUN unzip /home/OMM/OMM-12.2.1.3.0-20181012_Linux-x86-64.zip -d /home/OMM/

RUN tar -xjf /home/OMM/OMM-12.2.1.3.0-20181012.tbz2 -C /home/OMM/



# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*