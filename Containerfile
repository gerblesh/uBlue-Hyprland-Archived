ARG FEDORA_MAJOR_VERSION=38
ARG BASE_CONTAINER_URL=ghcr.io/ublue-os/base-main
FROM ${BASE_CONTAINER_URL}:${FEDORA_MAJOR_VERSION}
ARG RECIPE

# copy over files
COPY rootdir/etc /etc
COPY rootdir/usr /usr
RUN mkdir /tmp/myapps
COPY myapps /tmp/myapps
RUN mkdir /etc/homedir
COPY homedir /etc/homedir
COPY ${RECIPE} /tmp/ublue-recipe.yml
COPY build.sh /tmp/build.sh
COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq

# run the build script
RUN chmod +x /tmp/build.sh && /tmp/build.sh

# clean up and finalize container build
RUN rm -rf \
        /tmp/* \
        /var/* && \
    ostree container commit

