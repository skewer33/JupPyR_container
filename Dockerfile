# --- required versions of python and R ---
ARG R_VERSION=4.3.3
ARG PYTHON_VERSION=3.12

# --- Docker image for Jupyter with Python ---
# https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-minimal-notebook
FROM quay.io/jupyter/minimal-notebook:python-${PYTHON_VERSION}

USER root

# --- Installing the required packages and fonts ---
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends fontconfig debconf && \
    echo "ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true" | debconf-set-selections && \
    apt-get install -y --no-install-recommends ttf-mscorefonts-installer && \
    fc-cache -f -v && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# --- Installing system dependencies and utilities ---
RUN apt-get update && apt-get install -y --no-install-recommends \
    git-lfs \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libgit2-dev && \
    git lfs install && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# --- Installing the required version of R ---
RUN mamba install -y -c conda-forge --strict-channel-priority r-base=${R_VERSION} && mamba clean --all -f -y