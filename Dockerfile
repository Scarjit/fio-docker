FROM alpine:latest

LABEL maintainer="Ferdinand Linnenberg <ferdinand@linnenberg.dev>"
LABEL description="Docker image with fio pre-installed"
LABEL license="MIT and GPL-2.0"
LABEL source="https://github.com/Scarjit/fio-docker"

RUN apk add --no-cache fio sysbench lsblk util-linux

COPY run_tests.sh /usr/local/bin/run_tests.sh

RUN chmod +x /usr/local/bin/run_tests.sh

CMD ["/usr/local/bin/run_tests.sh"]
