FROM bitnami/phpbb:3.3.4

USER root

RUN install_packages unzip sendmail

# Template
RUN curl -L "https://github.com/v12mike/we_universal/archive/master.tar.gz" > "/tmp/we_universal.tar.gz" \
    && tar zxvf /tmp/we_universal.tar.gz -C "/tmp/" \
    && cp -r "/tmp/we_universal-master/style/we_universal" "/opt/bitnami/phpbb/styles/we_universal"

# Pages addon
RUN curl -L "https://github.com/phpbb-extensions/pages/archive/2.0.5.tar.gz" > "/tmp/pages.tar.gz" \
    && tar zxvf /tmp/pages.tar.gz -C "/tmp/" \
    && cp -r "/tmp/pages-2.0.5" "/opt/bitnami/phpbb/ext/phpbb/pages"

# Translations
RUN curl -L "https://github.com/phpbb-de/phpbb-translation/archive/release-3.3.4.tar.gz" > "/tmp/de.tar.gz" \
    && tar zxvf /tmp/de.tar.gz -C "/tmp/" \
    && cp -r "/tmp/phpbb-translation-release-3.3.4/language/de" "/opt/bitnami/phpbb/language/de"

# Calendar addon (see http://calendar.zoo-am-ring.de/viewforum.php?f=7)
RUN curl -L "http://calendar.zoo-am-ring.de/download/file.php?id=100" > "/tmp/calendar.zip" \
    && unzip -d /tmp /tmp/calendar.zip \
    && cp -r "/tmp/hjw" "/opt/bitnami/phpbb/ext/"


COPY dashboard.jpg /opt/bitnami/phpbb/styles/we_universal/theme/images/dashboard.jpg
COPY favicon.ico /opt/bitnami/phpbb/favicon.ico

RUN chown -R 1:root /opt/bitnami/phpbb/language/de \
    && chown -R 1:root /opt/bitnami/phpbb/favicon.ico \
    && chown -R 1:root /opt/bitnami/phpbb/ext \
    && chown -R 1:root /opt/bitnami/phpbb/styles/we_universal

ENV PHPBB_DATA_TO_PERSIST="store files images config.php"

USER 1001
