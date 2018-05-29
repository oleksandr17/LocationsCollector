# Dockerized solution

#### Configure local machine:
- Install docker.
- Install docker compose.
- Install ansible in case you want to deploy project on remote machine. It could be also necessary to install python. 

#### Configure remote machine:
- Install python (required for ansible).
- Install docker.
- Install docker compose.

#### How to:
- Execute `make prod` in order to deploy project on remote machine. The ansible-vault's password is required.
- Execute `make dev` in order to deploy project on local machine. Also execute `make venv_create` in order to create a virtual environment. It simplifies development process, e.g. it adds autocompletion to IDE.
- Execute `make tests` in order to run tests locally.
- Directory `postman` contains ready to use configuration. This configuration could be used as documentation.



# Manual solution

#### Setup machine:
- Execute `brew install nginx` in order to install nginx.
- Install PostgreSQL (reference - https://www.postgresql.org/download/macosx/).
- Install `pyenv` (reference - https://github.com/pyenv/pyenv#installation).

#### Setup project:
- Setup postgres database (reference - https://tutorial-extensions.djangogirls.org/en/optional_postgresql_installation/). Check project settings for reference.
- Execute `pyenv local` in order to switch to a proper python version.
- Execute `pip install -r requirements/requirements-versioned.txt` in order to create a virtual environment.
- Execute `. venv/bin/activate` in order to activate virtual environment.
- Execute `./manage.py migrate` in order to migrate database.

#### Start project:
- Execute `gunicorn -c gunicorn.conf.py wsgi` in order to launch gunicorn.



# TODO:
- [x] Setup models.
- [x] Implement a POST call.
- [x] Implement throttling.
- [x] Add logging to console.
- [x] Add unit tests.
- [x] Setup docker images.
- [x] Setup ansible, encrypt variables, pass variables to docker.
- [x] Implement ping call.
- [x] Add postman configuration.
- [x] Add admin.
- [x] Fix static files.
- [ ] Setup SSL for nginx.
- [ ] Assign domain name to IP.
- [ ] Add documentation.
