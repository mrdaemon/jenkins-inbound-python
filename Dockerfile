FROM jenkins/inbound-agent

USER root

# Install Python 3 and tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Install the latest version of uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

USER jenkins