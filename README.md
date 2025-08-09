# JupPyR - a working environment containing Jupyter, Python, R
A docker image built on the basis of [Jupyter-minimal notebook](https://hub.docker.com/r/jupyter/minimal-notebook), with python **3.12**, **R 4.3.3** installed
The image also includes `git`, `git lfs`, `curl`, `nano` (actually `nano-tiny`), `tzdata`, `unzip`, `vi`, and a set of `mscorefonts` fonts

For characteristics of the jupyter-minimal notebook prototype, see [link](https://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-minimal-notebook)

## Quickstart
Quickstart involves downloading and building the image and running the container.

Go to the working directory and run:

#### UNIX
```bash
cd path/to/dir
chmod +x quick_start.sh
bash quick_start.sh
```
#### Windows
```bash
cd path/to/dir
sh quick_start.sh
```

## Build
Go to the working directory, copy the image from github and build it.
```bash
cd path/to/dir
git clone https://github.com/skewer33/JupPyR_container.git
docker build -t juppyr_container .
```

You can explicitly specify the version of Python and R by specifying them as arguments `PYTHON_VERSION` and `R_VERSION` when building the image.

```bash
docker build --build-arg PYTHON_VERSION=3.10 --build-arg R_VERSION=4.4.2 -t juppyr_container .
```

*At the moment, only the latest version of R can be installed. The `R_VERSION` parameter is useless.*

## Run
After building, run the container by calling
```bash
docker-compose up
```

You also can run the container with other parameters by explicitly calling the run function with the desired parameters, for example:
```bash
docker run -it --rm \
    -p 8888:8888 \
    -v "$(pwd)":/home/jovyan/work \
    juppyr_container \
    start-notebook.sh --NotebookApp.token=''
```

## Testing

You can check that everything works by running the `testing_container.ipynb`  in the `test` directory in the container.

