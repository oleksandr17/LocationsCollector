# Configure local machine:
- Install docker.
- Install docker compose.
- Install ansible in case you want to deploy project on remote machine. It could be also necessary to install python. 

# Configure remote machine:
- Install python (required for ansible).
- Install docker.
- Install docker compose.

# How to:
- Execute `make docker_dev` in order to deploy project on local machine.
- Execute `make docker_tests` in order to run tests locally.
- Execute `make ansible_prod` in order to deploy project on remote machine.


# TODO:
- [x] Setup models.
- [x] Implement a POST call.
- [x] Implement throttling.
- [x] Add logging to console.
- [x] Add unit tests.
- [x] Setup docker images.
- [x] Setup ansible, encrypted variables, use variables in docker files.
- [ ] Add ping.
- [ ] Setup SSL for nginx.
- [ ] Add documentation.