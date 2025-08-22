# node-alpine-with-python

This repository builds and publishes a Docker image based on Node.js (Alpine variant) with Python 3 pre-installed from source. It is intended for environments (like CI/CD pipelines, DevContainers, etc.) that require both Node.js and Python.

## What this repository does

- **Dockerfile**: Builds a Docker image using customizable [Node.js](https://hub.docker.com/_/node) (Alpine base image) and [Python](https://www.python.org/) (built from source) versions.
- **GitHub Actions Workflow**: Automatically builds and pushes images to Docker Hub on push to the `main` branch, using versioned tagging.

## Image Tags Schema

Each build will publish tags using combinations of the Node.js and Python versions, for maximum flexibility. For example, with `NODE_VERSION=18.20.8` and `PYTHON_VERSION=3.10.18`, tags created are:

- `18.20.8-3.10.18`
- `18.20.8-3.10`
- `18.20-3.10.18`
- `18.20-3.10`
- `18-3.10.18`
- `18-3.10`

Tag format: `<node_version>-<python_version>`

Where `node_version` can be `major.minor.patch`, `major.minor`, or `major`; `python_version` can be `major.minor.patch` or `major.minor`.

Images are available at: [Docker Hub: mosathip/node-alpine-with-python](https://hub.docker.com/r/mosathip/node-alpine-with-python)

---

## GitHub Actions Setup

The provided workflow (see [`.github/workflows/docker.yml`](.github/workflows/docker.yml)) builds and pushes the image automatically. To enable Docker Hub publishing, set up these secrets in your GitHub repository:

### Required GitHub Variables

- `DOCKERHUB_USERNAME`: Your Docker Hub username.

### Required GitHub Secrets

- `DOCKERHUB_TOKEN`: A Docker Hub [access token](https://docs.docker.com/docker-hub/access-tokens/) with push access to your repository.

### Build Arguments (customize Node and Python versions)

Edit the top of `docker.yml`:

```yaml
env:
  NODE_VERSION: <your-node-version>
  PYTHON_VERSION: <your-python-version>
```

---

## Usage

To pull this image from Docker Hub:

```sh
docker pull mosathip/node-alpine-with-python:18.20.8-3.10.18
```

Substitute any valid version tag as shown above.

---

## File Overview

- `Dockerfile`: Build script for Node.js (Alpine) + Python 3 image (see [Node.js Docker image](https://hub.docker.com/_/node) and [Python source downloads](https://www.python.org/downloads/source/))
- `.github/workflows/docker.yml`: CI pipeline for building and publishing Docker image

---

## License

This project itself is provided with **no license**.

- For licensing of the base image, refer to [Node.js Docker Official Image License](https://github.com/nodejs/docker-node/blob/main/LICENSE).
- For Python built from source, refer to the [Python Software Foundation License](https://docs.python.org/3/license.html).
