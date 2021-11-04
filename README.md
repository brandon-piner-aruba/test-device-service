[![Python Version](https://img.shields.io/badge/python-3.8-blue?logo=Python&logoColor=yellow)](https://docs.python.org/3.8/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.68.0-009688?logo=FastAPI&labelColor=white)](https://fastapi.tiangolo.com/)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)
[![Build: just](https://img.shields.io/badge/%F0%9F%A4%96%20build-just-black?labelColor=white)](https://just.systems/)

# test device service

Get started by reading [INSTRUCTIONS](INSTRUCTIONS.md)

## Setup

Its advisable but not required to create a python 3.8 virtual environment for this project to keep packages separate.

Install the required dependencies by running

```sh
pip install -r requirements.txt -r dev-requirements.in
```

## Development

To run the server:

```sh
uvicorn --host=0.0.0.0 --port=8080 --reload test_device_service.server:app
```

### Lint & Test Code

The code can be formatted, tested and lint checked by exploring some of the commands in the Justfile
