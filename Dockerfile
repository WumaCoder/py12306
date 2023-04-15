FROM python:3.6.6

MAINTAINER <pjialin admin@pjialin.com>
ENV TZ Asia/Shanghai

WORKDIR /code

# RUN apt-get update && apt-get install -y g++ gcc libxml2-dev libxslt-dev python-dev libffi-dev openssl-dev make
RUN pip install websockets
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


RUN mkdir -p /data/query /data/user
VOLUME /data

COPY . .

COPY env.docker.py.example /config/env.py

CMD [ "python", "main.py" , "-c", "/config/env.py"]
