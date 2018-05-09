.PHONY: clean_venv install_unversioned_deps install_test_deps install_versioned_deps freeze_requirements clean_tox tox ansible docker_compose
UNVERSIONED_DEPS=requirements/base.txt
TEST_DEPS=requirements/test.txt
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
install_unversioned_deps: $(PIP)
	$(PIP) install -r $(UNVERSIONED_DEPS)

install_test_deps: $(PIP)
	$(PIP) install -r $(TEST_DEPS)

install_versioned_deps: $(PIP)
	$(PIP) install -r $(VERSIONED_DEPS)

# Freeze dependencies
freeze_requirements: clean_venv install_unversioned_deps
	$(PIP) freeze -r $(UNVERSIONED_DEPS) > $(VERSIONED_DEPS)

# Misc
pytest_clean:
	rm -rfd __pycache__
	#find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf

# Tox
$(TOX): $(PIP)
	$(PIP) install tox

tox: $(TOX)
	$(TOX) ${ARGS}

tox_clean:
	@rm -rf .pytest_cache
	@rm -rf .tox
	@rm -rf src/htmlcov
	@rm -f  src/.coverage

# Ansible
ansible:
	cd ansible && echo "$ANSIBLE_VAULT_PROD" | ansible-playbook locations_collector.yml -t deploy -i inventory/locations_collector -b --ask-vault-pass

# Docker
docker_compose_prod: pytest_clean
	cd docker && \
	docker-compose -f docker-compose-prod.yml stop && \
	docker-compose -f docker-compose-prod.yml rm --force && \
	docker-compose -f docker-compose-prod.yml build && \
	docker-compose -f docker-compose-prod.yml up

docker_compose_tox: pytest_clean
	cd docker && \
	docker-compose -f docker-compose-tox.yml stop && \
	docker-compose -f docker-compose-tox.yml rm --force && \
	docker-compose -f docker-compose-tox.yml build && \
	docker-compose -f docker-compose-tox.yml up