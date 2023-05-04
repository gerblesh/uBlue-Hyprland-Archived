ARG FEDORA_MAJOR_VERSION=38
ARG BASE_CONTAINER_URL=ghcr.io/ublue-os/base-main
FROM ${BASE_CONTAINER_URL}:${FEDORA_MAJOR_VERSION}
ARG RECIPE

# copy over files
COPY rootdir /
COPY apps /tmp/apps
COPY home /var/opt/home
COPY ${RECIPE} /tmp/ublue-recipe.yml
COPY build.sh /tmp/build.sh
COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq

# run the build script
RUN chmod +x /tmp/build.sh && /tmp/build.sh

# make home installer script executable for later
RUN chmod +x /var/opt/home/install_home.sh

# clean up and finalize container build
RUN rm -rf \
        /tmp/* \
        /var/* && \
    ostree container commit

