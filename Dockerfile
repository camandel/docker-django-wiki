FROM debian:latest
MAINTAINER Carlo Mandelli "camandel@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y --force-yes --no-install-recommends \
	python \
	python-pip \
	python-dev \
        python-imaging \
	gcc \
	ca-certificates \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN pip install wiki

ADD testproject /testproject/

EXPOSE 8000

ENTRYPOINT ["python","/testproject/manage.py","runserver","0.0.0.0:8000"]
