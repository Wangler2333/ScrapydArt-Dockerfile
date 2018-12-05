#
# Dockerfile for scrapydart:py3
#

FROM debian:stretch
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get install -y autoconf \
                          build-essential \
                          curl \
                          git \
                          libffi-dev \
                          libssl-dev \
                          libtool \
                          libxml2 \
                          libxml2-dev \
                          libxslt1.1 \
                          libxslt1-dev \
                          python3 \
                          python3-dev \
                          vim-tiny \
    && apt-get install -y libtiff5 \
                          libtiff5-dev \
                          libfreetype6-dev \
                          libjpeg62-turbo \
                          libjpeg62-turbo-dev \
                          liblcms2-2 \
                          liblcms2-dev \
                          libwebp6 \
                          libwebp-dev \
                          zlib1g \
                          zlib1g-dev \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip install scrapydart \
    && apt-get purge -y --auto-remove autoconf \
                                      build-essential \
                                      libffi-dev \
                                      libssl-dev \
                                      libtool \
                                      libxml2-dev \
                                      libxslt1-dev \
                                      python3-dev \
    && apt-get purge -y --auto-remove libtiff5-dev \
                                      libfreetype6-dev \
                                      libjpeg62-turbo-dev \
                                      liblcms2-dev \
                                      libwebp-dev \
                                      zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

COPY ./scrapyd.conf /etc/scrapydart/scrapydart.conf
VOLUME /dbs/ /dbs/
EXPOSE 6800

CMD ["scrapydart"]