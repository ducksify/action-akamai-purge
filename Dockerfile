FROM debian:10-slim
ARG BUILD_DATE
ARG VCS_REF
ARG CLI_PURGE_RELEASE=1.1.0
ENV DEBIAN_FRONTEND=noninteractive

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="Github Action - Akamai Purge" \
      org.label-schema.description="Purge content from the Akamai network directly from your github workflow" \
      org.label-schema.url="https://ducksify.com/" \
      org.label-schema.vcs-url="https://github.com/ducksify/action-akamai-purge" \
      org.label-schema.vendor="Ducksify SA" \
      org.label-schema.schema-version="1.0"

RUN apt-get update \
    && apt-get -y install ca-certificates

ADD https://github.com/akamai/cli-purge/releases/download/${CLI_PURGE_RELEASE}/akamai-purge-${CLI_PURGE_RELEASE}-linuxamd64 /usr/local/bin/purge
RUN chmod +x /usr/local/bin/purge

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
