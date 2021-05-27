ARG VERSION=latest
FROM golang:$VERSION

COPY get_packages.sh /get_packages.sh

ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/54d1f0bfeb6557adf8a3204455389d0901652242/wait-for-it.sh /bin/wait-for-it
RUN chmod +x /bin/wait-for-it

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD /entrypoint.sh
