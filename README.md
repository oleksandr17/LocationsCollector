# Prepare host:
- Install PostgreSQL (reference - https://www.postgresql.org/download/macosx/).
- Setup postgres database (reference - https://tutorial-extensions.djangogirls.org/en/optional_postgresql_installation/).
- Install `pyenv` (reference - https://github.com/pyenv/pyenv#installation).
- Execute `pyenv local`in order to switch to a proper python version and `make install_versioned_deps` in order to create a virtual environment.
- Execute `. venv/bin/activate` in order to switch to virtual environment.
- Execute `./manage.py  migrate` in order to migrate database.  
- Execute `./manage.py shell < ../initialise/create_user_and_token.py` in order to create user and token. 

# TODO:
- [x] Setup models.
- [x] Implement a POST call.
- [x] Implement token authentication.
- [ ] Implement throttling.
- [ ] Add logging.
- [ ] Create docker images for python app and postgres datagbase.  
- [ ] Add documentation and postman configs.
