# JupPyR - a working environment containing Jupyter, Python, R
A docker image built on the basis of [Jupyter-minimal notebook](https://hub.docker.com/r/jupyter/minimal-notebook), with python 3.12, R 4.3.3 installed
The image also includes git, git lfs, curl, git, nano (actually nano-tiny), tzdata, unzip, vi, and a set of mscorefonts fonts

For characteristics of the jupyter-minimal notebook prototype, see [link](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-minimal-notebook)

## Build

```bash
cd path/to/dir
git clone https://github.com/skewer33/JupPyR_container.git
docker build -t JupPyR .
```

## Modification

This image, as mentioned earlier, is based on Python 3.12 and R 4.3.3. If you want to build based on other versions of these languages, go to the dockerfile and edit the lines:

```bash
ARG R_VERSION=4.3.3
ARG PYTHON_VERSION=3.12
```

