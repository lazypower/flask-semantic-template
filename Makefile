all: coverage lint run_server
	
depends: 
	venv/bin/pip install -q -r requirements.txt --upgrade

develop: setup
	venv/bin/pip install -q -r requirements.txt

venv_boot:
	virtualenv venv --distribute

run_server:
	venv/bin/python app/__init__.py

assets:
	bower install app/bower.json

setup: venv/bin/python
	venv/bin/pip install -q -r requirements.test.txt

venv/bin/python:
	virtualenv venv
	venv/bin/pip install 'distribute>=0.6.45'

coverage: clean
	@venv/bin/nosetests tests --with-coverage --cover-package=app

lint: 
	@find $(sources) -type f \( -iname '*.py' ! -iwholename './venv/*' ! -iwholename './charms/*' ! -iwholename './cabs-client.py' ! -iwholename './offline_bundle/*' \) -print0 | xargs -r0 venv/bin/flake8

clean:
	find . -name \*.pyc -delete
	find . -name '*.bak' -delete
	rm -f .coverage

clean_all: clean
	rm -rf venv

venv/bin/python:
	virtualenv venv
	venv/bin/pip install 'distribute>=0.6.45'


