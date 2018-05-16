# Configure local machine:
- Install docker.
- Install docker compose.
- Install ansible in case you want to deploy project on remote machine. It could be also necessary to install python. 

# Configure remote machine:
- Install python (required for ansible).
- Install docker.
- Install docker compose.

# How to:
- Execute `make prod` in order to deploy project on remote machine.
- Execute `make dev` in order to deploy project on local machine.
- Execute `make tests` in order to run tests locally.


# TODO:
- [x] Setup models.
- [x] Implement a POST call.
- [x] Implement throttling.
- [x] Add logging to console.
- [x] Add unit tests.
- [x] Setup docker images.
- [x] Setup ansible, encrypt variables, pass variables to docker.
- [ ] Add ping.
- [ ] Add admin.
- [ ] Setup SSL for nginx.
- [ ] Add documentation.