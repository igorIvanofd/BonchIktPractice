FROM python:3.6.8-jessie

ENV PYTHONUNBUFFERED 1
ENV FLASK_APP src/app.py

WORKDIR /app

ADD . .

RUN apt-get -q update && apt-get -qy install netcat
RUN rm -rf /var/cache/

RUN pip install -r requirements.txt

CMD /bin/sh docker-entrypoint.sh
