.PHONY: pycache_clean prod dev tests tox tox_clean

pycache_clean:
	find . -type f -name "*.py[co]" -delete -or -type d -name "__pycache__" -delete

prod: pycache_clean
	ansible-playbook ansible/locations_collector.yml -t deploy -i ansible/inventory/locations_collection -b --ask-vault-pass

dev: pycache_clean
	docker-compose -f docker/dev/docker-compose.yml up --build --force-recreate

tests: pycache_clean
	docker-compose -f docker/dev/docker-compose.yml -p tests build
	docker-compose -f docker/dev/docker-compose.yml -p tests run app /bin/bash -c "pip install tox && cd /app && tox"

# Virtual env
venv_clean:
	@rm -rf venv

venv_create: venv_clean
	python -m venv venv
	venv/bin/pip install -U pip
	venv/bin/pip install -r requirements/requirements-versioned.txt