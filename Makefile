.PHONY: pytest_clean docker_prod docker_dev docker_tox ansible tox_clean

# Utils
pytest_clean:
	find . | grep -E "__pycache__" | xargs rm -rf

# Tox
tox: pytest_clean
	tox

tox_clean:
	@rm -rf .pytest_cache
	@rm -rf .tox
	@rm -rf src/htmlcov
	@rm -f  src/.coverage

# Docker (for local machine)
docker_dev: pytest_clean
	docker-compose -f docker/dev/docker-compose.yml up --build --force-recreate

docker_tests: pytest_clean
	docker-compose -f docker/dev/docker-compose.yml -p tests build
	docker-compose -f docker/dev/docker-compose.yml -p tests run app /bin/bash -c "pip install tox && cd /app && tox"

# Ansible (for remote machine)
ansible_prod: pytest_clean
	ansible-playbook ansible/locations_collector.yml -t deploy -i ansible/inventory/locations_collection -b --ask-vault-pass