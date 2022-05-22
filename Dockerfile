FROM python:3.7-alpine
RUN pip install pipenv

COPY / /app
WORKDIR /app
# UPGRADE PIP
RUN /usr/local/bin/python -m pip install --upgrade pip
# Install some dump requirements for demo purposes
RUN pip install -r ./requirements.txt
# CMD []
