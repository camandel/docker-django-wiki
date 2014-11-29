#docker-django-wiki

Dockerfile and configuration files to create a simple [django-wiki](https://github.com/django-wiki/django-wiki) container.
### Installation
```sh
$ sudo docker pull camandel/django-wiki
```
### Usage
```sh
$ sudo docker run -d -P --name=django-wiki camandel/django-wiki
$ sudo docker port django-wiki 8000
0.0.0.0:49153
$ wget http://localhost:49153 (admin/admin)
```
