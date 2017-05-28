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
### Customization
You can change configurations, templates and db:
```sh
$ git clone https://github.com/camandel/docker-django-wiki.git ~/src
```
Then copy the directories for what you need to modify and mount them as volumes:
```sh
$ cp -a ~/src/docker-django-wiki/testproject/testproject/{db,templates,settings} /mydata
$ sudo docker run -d -P -v /mydata/db:/db:z -v /mydata/templates:/templates:z -v /mydata/settings:/settings:z --name=django-wiki camandel/django-wiki
```
SECRET_KEY is now in a separate file. If not present it will be generated:
```sh
cat /mydata/settings/secret_key.py
SECRET_KEY='your-secret-key'
```
### Backup
To backup the sqlite db copy it to a local directory or use a persistent volume:
```sh
$ sudo docker run -d -P -v /mydata/db:/db:z --name=django-wiki camandel/django-wiki
$ echo '.dump' | sqlite3 /mydata/db/db.sqlite3 > /mydata/backup/wiki.dump
```
To restore:
```sh
$ sqlite3 /mydata/db/db.sqlite3 < /mydata/backup/wiki.dump
```
