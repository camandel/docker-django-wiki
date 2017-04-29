# docker-django-wiki

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
### Backup
To backup the sqlite db copy it to a local directory or use a persistent volume:
```sh
git clone https://github.com/camandel/docker-django-wiki.git /tmp/mydata
docker run -d -P -v /tmp/mydata/testproject:/testproject --name=django-wiki camandel/django-wiki
echo '.dump' | sqlite3 /tmp/mydata/testproject/db.sqlite3 > /tmp/wiki.dump
```
To restore:
```sh
sqlite3 /tmp/mydata/testproject/db.sqlite3 < /tmp/wiki.dump
```
