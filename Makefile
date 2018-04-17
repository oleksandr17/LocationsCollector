.PHONY: clean_venv install_unversioned_deps freeze_requirements install_versioned_deps
UNVERSIONED_DEPS=requirements/base.txt
VERSIONED_DEPS=requirements.txt
PIP=venv/bin/pip

clean_venv:
	@rm -rf venv

$(PIP):
	python -m venv venv
	$(PIP) install -U pip

install_unversioned_deps: $(PIP)
	$(PIP) install -r $(UNVERSIONED_DEPS)

freeze_requirements: clean_venv install_unversioned_deps
	$(PIP) freeze -r $(UNVERSIONED_DEPS) > $(VERSIONED_DEPS)

install_versioned_deps: $(PIP)
	$(PIP) install -r $(VERSIONED_DEPS)