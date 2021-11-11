# Docker image for XMM-Newton SAS

We have a docker image including HEASOFT 6.29 and SAS 19.0 together with the XMM-Newton CALDB (as of 11 November 2021).
The HEASOFT CALDB is set to be the ONLINE one.
The image contains also the jupyter notebook and the pyxmmsas package by C. Ferrigno that wraps useful functions from SAS and XSPEC.

The image can be retrieved with

```bash
docker pull juliojlgon/sas:latest
```

To ease the use, we provide two utility scripts:

* sas_docker.sh is used as:

```bash
./sas_docker.sh "Any command"
```

to run "Any command" using the current dir mounted as /home/heasoft in the container.

* sas_docker_notebook.sh

```bash
./sas_docker_notebook.sh
```

launches a jupyter notebook from the current dir (make sure that sas_docker.sh is also in the current dir)

## User Makefile (it works also for Darwin OS)

The file Makefile_user can be copied in any folder to use this container through the [script](https://gitlab.astro.unige.ch/ferrigno/sas-docker/-/blob/master/sas_docker.sh)

```bash
make -f User-Makefile shell
```

will open a shell in the current folder.

```bash
make -f User-Makefile notebook
```

will open a python notebook engine in the current folder.

# Example to start a session on the current folder from the comand line

```bash
docker run -e HOME=/home/heasoft -v $PWD:/home/heasoft -it carloferrigno/sas:latest bash
source /usr/local/bin/init.sh
source /usr/local/bin/init_sas.sh
```

# Build the image

```bash
make build
```

builds a docker image starting from downloaded ds9 and sas that need to be specified in the Dockerfile

```bash
make squash
```

squashes all layers of the docker image (idependency *pip install docker-squash*)

```bash
make singularity
```

buiilds a singularity image from the squashed images. It is placed in the current folder and it is owned by root (files has suffix .sif)
