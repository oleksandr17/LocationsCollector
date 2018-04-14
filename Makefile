.PHONY: clean_venv freeze_requirements
UNVERSIONED_DEPS=requirements/base.txt
VERSIONED_DEPS=requirements.txt
PIP=venv/bin/pip

clean_venv:
	@rm -rf venv

$(PIP):
	python -m venv venv
	$(PIP) install -U pip
	$(PIP) install -r $(UNVERSIONED_DEPS)

freeze_requirements: clean_venv $(PIP)
	$(PIP) freeze -r $(UNVERSIONED_DEPS) > $(VERSIONED_DEPS)

