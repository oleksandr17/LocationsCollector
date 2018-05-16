.PHONY: pytest_clean prod dev tests tox tox_clean

pytest_clean:
	find . | grep -E "__pycache__" | xargs rm -rf

prod: pytest_clean
	ansible-playbook ansible/locations_collector.yml -t deploy -i ansible/inventory/locations_collection -b --ask-vault-pass

dev: pytest_clean
	docker-compose -f docker/dev/docker-compose.yml up --build --force-recreate

tests: pytest_clean
	docker-compose -f docker/dev/docker-compose.yml -p tests build
	docker-compose -f docker/dev/docker-compose.yml -p tests run app /bin/bash -c "pip install tox && cd /app && tox"

# Tox
tox: pytest_clean
	tox

tox_clean:
	@rm -rf .pytest_cache
	@rm -rf .tox
	@rm -rf src/htmlcov
	@rm -f  src/.coverage