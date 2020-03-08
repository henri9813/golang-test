ARG VERSION=latest
FROM golang:$VERSION

COPY get_packages.sh /get_packages.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT /entrypoint.sh
