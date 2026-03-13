FROM kimai/kimai2:apache

# Cloudflare Containers requires the port to be exposed explicitly
EXPOSE 8001

# Bypass dbtest.php for TiDB SSL Support
COPY dummy_dbtest.php /dbtest.php

# Patch Kimai Doctrine ORM and SAML support
COPY doctrine.yaml /opt/kimai/config/packages/doctrine.yaml
COPY saml.yaml /opt/kimai/config/packages/saml.yaml

# Bypass Kimai synchronous initialization so Cloudflare doesn't timeout the worker
COPY custom_entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
