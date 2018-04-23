.PHONY: clean_venv install_unversioned_deps install_versioned_deps freeze_requirements clean_tox tox
UNVERSIONED_DEPS=requirements/base.txt
VERSIONED_DEPS=requirements.txt
PIP=venv/bin/pip
TOX=venv/bin/tox

# Virtual env
clean_venv:
	@rm -rf venv

$(PIP):
	python -m venv venv
	$(PIP) install -U pip

# Install dependencies
install_unversioned_deps: clean_venv $(PIP)
	$(PIP) install -r $(UNVERSIONED_DEPS)

install_versioned_deps: $(PIP)
	$(PIP) install -r $(VERSIONED_DEPS)

# Freeze dependencies
freeze_requirements: install_unversioned_deps
	$(PIP) freeze -r $(UNVERSIONED_DEPS) > $(VERSIONED_DEPS)

# Tox
$(TOX): $(PIP)
	$(PIP) install tox

tox: $(TOX)
	$(TOX) ${ARGS}

clean_tox:
	@rm -rf .pytest_cache
	@rm -rf .tox
	@rm -rf htmlcov
	@rm -f .coverage