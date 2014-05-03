all: venv_activate run_server
	pip install -r requirements.txt --upgrade

venv_activate:
	. venv/bin/activate

venv_boot:
	virtualenv venv --distribute

run_server:
	python app/main.py
