.PHONY: all formatting static-analysis test report

all: formatting static-analysis test report

project_name = app

formatting:
	poetry run isort $(project_name) tests
	poetry run black $(project_name) tests

static-analysis:
	poetry run mypy app

test:
	poetry run coverage run -m pytest --durations=10

report:
	poetry run coverage report -m
