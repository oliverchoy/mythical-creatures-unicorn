# > make build OUT_FILE=./outfile.zip
OUT_FILE?=./mythical.zip

DELIVERABLE=$(abspath $(OUT_FILE))

install:
	pipenv install --three

uninstall:
	pipenv --rm

run:
	pipenv run python ./hello_lambda.py

clean:
	rm -f ${DELIVERABLE}

build:
	export VENV=$(pipenv --venv)
	cd ${VENV}/lib/python3.8/site-packages && zip -r9 ${DELIVERABLE} ./*
	zip -r9 ${DELIVERABLE} *.py
