# Show this message and exit.
help:
	@just --list

# Clean temporary files from repo folder
clean:
	rm -rf build dist wheels *.egg-info
	rm -rf */build */dist
	find . -path '*/__pycache__/*' -delete
	find . -type d -name '__pycache__' -empty -delete
	rm -rf '.mypy_cache'
	rm -rf '.pytest_cache'
	rm -rf '.coverage'

# Install pip-tools
install-pip-tools:
	pip install --quiet pip-tools

# Create requirements.txt file
requirements:
	@just install-pip-tools
	pip-compile

# Setup requirements
setup:
	@just requirements
	pip install -r requirements.txt

# Setup dev requirements
setup-dev:
	@just requirements
	pip install -r requirements.txt -r dev-requirements.in

# Auto-format the code
fmt:
	isort .
	flynt --quiet .
	black .

# Run all lints
lint:
	flake8 .
	flynt --dry-run --fail-on-change --quiet .
	isort --diff --check .
	black --diff --check .
	mypy .
	yamllint .

# Run tests
test +ARGS='':
	coverage run -m unittest {{ARGS}}

# Create coverage report
coverage:
	coverage xml --omit=tests/*
	coverage report --include=tests/* --skip-covered --show-missing --fail-under=100

# Run service locally
run:
	uvicorn --host=0.0.0.0 --port=8080 --reload test_device_service.server:app
