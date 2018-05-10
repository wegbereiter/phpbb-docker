FROM bitnami/phpbb:3

RUN echo nameserver 8.8.8.8 > /etc/resolve.conf \
    && apt-get update \
    && apt-get install unzip \
    # && curl -L "https://github.com/inventea/we_universal/archive/v2.4.6.tar.gz" > "/tmp/we_universal.tar.gz" \
    # && curl -L "https://github.com/melvingb/we_universal/archive/master.tar.gz" > "/tmp/we_universal.tar.gz" \
    && curl -L "https://github.com/v12mike/we_universal/archive/master.tar.gz" > "/tmp/we_universal.tar.gz" \
    && tar zxvf /tmp/we_universal.tar.gz -C "/tmp/" \
    && cp -r "/tmp/we_universal-master" "/opt/bitnami/phpbb/styles/we_universal" \
    && curl -L "https://github.com/phpbb-extensions/pages/archive/2.0.2.tar.gz" > "/tmp/pages.tar.gz" \
    && tar zxvf /tmp/pages.tar.gz -C "/tmp/" \
    && cp -r "/tmp/pages-2.0.2" "/opt/bitnami/phpbb/ext/phpbb/pages" \
    && curl -L "https://github.com/phpbb-de/phpbb-translation/archive/release-3.2.2.tar.gz" > "/tmp/de.tar.gz" \
    && tar zxvf /tmp/de.tar.gz -C "/tmp/" \
    && cp -r "/tmp/phpbb-translation-release-3.2.2/language/de" "/opt/bitnami/phpbb/language/de" \
    && curl -L "http://calendar.zoo-am-ring.de/download/file.php?id=52&lang=de" > "/tmp/calendar.zip" \
    && unzip -d /tmp /tmp/calendar.zip \
    && cp -r "/tmp/hjw" "/opt/bitnami/phpbb/ext/"

COPY dashboard.jpg /opt/bitnami/phpbb/styles/we_universal/theme/images/dashboard.jpg
COPY favicon.ico /opt/bitnami/phpbb/favicon.ico
