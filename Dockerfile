FROM bitnami/phpbb:3

RUN echo nameserver 8.8.8.8 > /etc/resolve.conf \
    # && curl -L "https://github.com/inventea/we_universal/archive/v2.4.6.tar.gz" > "/tmp/we_universal.tar.gz" \
    && curl -L "https://github.com/melvingb/we_universal/archive/master.tar.gz" > "/tmp/we_universal.tar.gz" \
    && tar zxvf /tmp/we_universal.tar.gz -C "/tmp/" \
    && cp -r "/tmp/we_universal-master" "/opt/bitnami/phpbb/styles/we_universal" \
    && curl -L "https://github.com/phpbb-de/phpbb-translation/archive/release-3.2.1.tar.gz" > "/tmp/de.tar.gz" \
    && tar zxvf /tmp/de.tar.gz -C "/tmp/" \
    && cp -r "/tmp/phpbb-translation-release-3.2.1/language/de" "/opt/bitnami/phpbb/language/de"

COPY dashboard.jpg /opt/bitnami/phpbb/styles/we_universal/theme/images/dashboard.jpg
COPY favicon.ico /opt/bitnami/phpbb/favicon.ico