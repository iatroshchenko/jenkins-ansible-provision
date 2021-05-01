FROM jenkinsci/blueocean

USER root

RUN apk add --no-cache py-pip python3-dev \
    libffi-dev openssl-dev \
    gcc libc-dev make

RUN echo "cryptography==3.3.2" > /tmp/requirements.txt
RUN pip3 install -U docker-compose -r /tmp/requirements.txt
RUN rm /tmp/requirements.txt

USER jenkins
