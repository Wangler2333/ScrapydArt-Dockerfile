#
# Dockerfile for scrapydart:py3.6
#

FROM python:3.6.7-stretch

COPY ./ScrapydArt /ScrapydArt
WORKDIR /ScrapydArt
RUN easy_install pyasn1-0.4.4-py3.6.egg && python3 setup.py install

COPY ./scrapyd.conf /etc/scrapydart/scrapydart.conf
# VOLUME /dbs/ /dbs/
EXPOSE 6800

CMD ["scrapydart"]