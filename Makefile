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

# Docker
docker_prod: pytest_clean
	docker-compose -f docker/prod/docker-compose.yml up --build --force-recreate

docker_dev: pytest_clean
	docker-compose -f docker/dev/docker-compose.yml up --build --force-recreate

docker_tests: pytest_clean
	docker-compose -f docker/dev/docker-compose.yml -p tests build
	docker-compose -f docker/dev/docker-compose.yml -p tests run app /bin/bash -c "pip install tox && cd /app && tox"

# Ansible
ansible:
	cd ansible && ansible-playbook locations_collector.yml -t deploy -i inventory/locations_collection -b --ask-vault-pass