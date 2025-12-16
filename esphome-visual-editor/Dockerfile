ARG BUILD_FROM=ghcr.io/victorigualada/esphome-visual-editor:latest
FROM ${BUILD_FROM}

ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

LABEL \
  io.hass.type="addon" \
  io.hass.arch="${BUILD_ARCH}" \
  io.hass.version="${BUILD_VERSION}" \
  org.opencontainers.image.title="ESPHome Visual Editor (Home Assistant application)" \
  org.opencontainers.image.description="Schema-driven visual editor for ESPHome configs" \
  org.opencontainers.image.created="${BUILD_DATE}" \
  org.opencontainers.image.revision="${BUILD_REF}" \
  org.opencontainers.image.version="${BUILD_VERSION}" \
  org.opencontainers.image.source="https://github.com/victorigualada/hassio-addons"


