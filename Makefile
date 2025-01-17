# Licensed under the Apache License: http://www.apache.org/licenses/LICENSE-2.0
# For details: https://github.com/nedbat/django_coverage_plugin/blob/master/NOTICE.txt

# Makefile for django_coverage_plugin

help:					## Show this help.
	@echo "Available targets:"
	@grep '^[a-zA-Z]' $(MAKEFILE_LIST) | sort | awk -F ':.*?## ' 'NF==2 {printf "  %-26s%s\n", $$1, $$2}'

test:					## Run all the tests.
	tox -q -- -q

clean:					## Remove non-source files.
	-rm -rf *.egg-info
	-rm -rf build dist
	-rm -f *.pyc */*.pyc */*/*.pyc */*/*/*.pyc */*/*/*/*.pyc */*/*/*/*/*.pyc
	-rm -f *.pyo */*.pyo */*/*.pyo */*/*/*.pyo */*/*/*/*.pyo */*/*/*/*/*.pyo
	-rm -f *.bak */*.bak */*/*.bak */*/*/*.bak */*/*/*/*.bak */*/*/*/*/*.bak
	-rm -rf __pycache__ */__pycache__ */*/__pycache__ */*/*/__pycache__ */*/*/*/__pycache__ */*/*/*/*/__pycache__
	-rm -f MANIFEST
	-rm -f .coverage .coverage.* coverage.xml
	-rm -f setuptools-*.egg distribute-*.egg distribute-*.tar.gz

sterile: clean                          ## Remove all non-controlled content, even if expensive.
	-rm -rf .tox*


kit:					## Make the source distribution.
	python setup.py sdist --formats=gztar

kit_upload:				## Upload the built distributions to PyPI.
	twine upload --verbose dist/*
