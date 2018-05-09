.PHONY: pytest_clean docker_prod docker_dev docker_tox ansible tox_clean

# Docker
pytest_clean:
	find . | grep -E "__pycache__" | xargs rm -rf

docker_prod: pytest_clean
	docker-compose -f docker/prod/docker-compose.yml up --build --force-recreate

docker_dev: pytest_clean
	docker-compose -f docker/dev/docker-compose.yml up --build --force-recreate

docker_tox: pytest_clean
	docker-compose -f docker/dev/docker-compose.yml -p tests build
	docker-compose -f docker/dev/docker-compose.yml -p tests run app /bin/bash -c "pip install tox && cd /app && tox"

# Ansible
ansible:
	cd ansible && echo "$ANSIBLE_VAULT_PROD" | ansible-playbook locations_collector.yml -t deploy -i inventory/locations_collector -b --ask-vault-pass

# Tox
tox_clean:
	@rm -rf .pytest_cache
	@rm -rf .tox
	@rm -rf src/htmlcov
	@rm -f  src/.coverage