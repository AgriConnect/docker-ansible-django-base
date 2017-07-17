Docker image for testing and depoying Django web app.

This image contains these softwares:

- [su-exec](https://github.com/ncopa/su-exec), simple replacement for `sudo`
- Python 3
- PostgreSQL
- Redis
- Ansible (for deploying)
- SSH client
- Rsync
- Pytest, pytest-django, pytest-flakes
- Some header (dev) packages for building Python modules

This image doesn't contain Django. Django and other Python modules should be installed separately in container.

