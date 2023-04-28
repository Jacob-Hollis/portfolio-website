FROM python:3.10-alpine

EXPOSE 8000

RUN apk add --no-cache gcc python3-dev musl-dev build-base

ADD . /django_ec2

WORKDIR /django_ec2

RUN pip install --upgrade pip

RUN pip install --upgrade wheel

RUN pip install -r requirements.txt

RUN python portfolio-website/manage.py makemigrations

RUN python portfolio-website/manage.py migrate

CMD [ "python", "portfolio-website/manage.py", "runserver", "0.0.0.0:8000" ]