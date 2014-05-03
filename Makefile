all: venv_activate run_server
	
depends: venv_activate
	venv/bin/pip install -q -r requirements.txt --upgrade

venv_activate:
	. venv/bin/activate

venv_boot:
	virtualenv venv --distribute

run_server:
	venv/bin/python app/main.py

assets:
	bower install app/bower.json
