# Coming Soon! 🚧

Written in Django  
[![](https://skillicons.dev/icons?i=django)](https://skillicons.dev)

## Installation Instructions

### You'll use these every time you need to run the dev environment
- venv\Scripts\activate.bat
    - activate the virtual environment
- python manage.py runserver
    - run the dev web server on localhost:8000

### One time install commands for local development (run in venv)
- pip install django
- pip install django-bootstrap-v5
- pip install django-sass
- pip install libsass django-compressor django-sass-processor
- pip install fontawesomefree

### Deployment Steps
- you'll need Docker, and we'll be deploying to AWS Beanstalk
- Dockerfile already exists in the project
- so does requirements.txt, but if it doesn't do a "pip freeze > requirements.txt"
- run "docker build . -t django_ec2"
- test with "docker run -d -p 8000:8000 django_ec2"
- login to Docker using 'docker login'
- tag the image using 'docker tag django_ec2 DOCKERHUB_USERNAME/django_ec2'
- Push it to Dockerhub using 'docker push DOCKERHUB_USERNAME/django_ec2'
- Create the AWS EC2 instance
- SSH into the instance using 'ssh -i PRIVATE_KEY_FILE_NAME ec2-user@PUBLIC_DNS_OF_INSTANCE'
- While inside the instance, run 'docker run -d -p 8000:8000 DOCKERHUB_USERNAME/django_ec2' to pull the image into our AWS instance and run it
  - This can also be used to update the image
- refer to https://stackabuse.com/deploying-django-applications-to-aws-ec2-with-docker/ for the full set of instructions




