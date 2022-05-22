FROM python:3.7-alpine
RUN pip install pipenv

COPY / /app
WORKDIR /app
# Install some dump requirements for demo purposes
RUN pip install -r ./requirements.txt
# CMD []
