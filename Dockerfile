FROM alpine:latest

RUN apk --no-cache add \
    rclone \
    bash

COPY entrypoint.sh /entrypoint.sh

CMD ["bash", "/entrypoint.sh"]
