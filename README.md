# Steps:

#### Once:
- Install PostgreSQL (reference - https://www.postgresql.org/download/macosx/).
- Setup postgres database (reference - https://tutorial-extensions.djangogirls.org/en/optional_postgresql_installation/).
- Create user and token. Token is needed for authentication.

#### Repetitive:
- Execute `pyenv local`in order to switch to a proper python version.
- Execute `make venv/bin/pip` in order to create a virtual environment. 

# TODO:
- [ ] Setup models.
- [ ] Implement a POST call.
- [ ] Implement authentication and throttling.
- [ ] Create docker images for python app and postgres datagbase.  
- [ ] Add documentation and postman configs.
- [ ] Add logging.
