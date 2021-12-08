FROM ubuntu:focal
RUN apt update && apt install -y git sed findutils jq curl
ENV user user
RUN useradd -m -d /app ${user} \
 && chown -R ${user} /app
USER ${user}
ADD demisto-image-puller /app/
ADD download-frozen-image-v2.sh /app/
WORKDIR /app
ENV content_pack_version=21.11.1
VOLUME /app/docker
ENTRYPOINT /app/demisto-image-puller $content_pack_version