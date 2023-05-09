Built with Django  
[![](https://skillicons.dev/icons?i=django)](https://skillicons.dev)

## Overview

The dev and production environments are encapsulated in Docker containers. Thus, testing and deployments use Docker Compose.


## Requirements
### You'll use these every time you need to run the dev environment
- latest version of Python
- Docker and Docker Compose
- (Optional) Venv
    - I used this for initial testing, but you can only use Docker, which I recommend.



## Deployment Steps
- I used an AWS EC2 Linux instance to host. You can use whatever cloud provider you wish provided it supports Docker images.
- Commands to deploy on server:
    - clone from Github or pull changes once cloned
    - docker system prune -a
        - this is just cleanup beforehand, but you can limit to the specific images/containers if you wish
    - docker-compose -f docker-compose.deploy.yml run --rm certbot /opt/certify-init.sh
    - (Optional) docker-compose -f docker-compose.deploy.yml exec app python manage.py collectstatic --no-input --clear
        - run this if you haven't collected static files yet
    - docker-compose -f docker-compose.deploy.yml down
    - docker-compose -f docker-compose.deploy.yml up -d
        - use the -d prefix to run detached, although not strictly necessary
    - (Optional) docker-compose -f docker-compose.deploy.yml exec app python manage.py runscript load
        - use this to 
- I used [this](https://londonappdeveloper.com/django-docker-deployment-with-https-using-letsencrypt/) documentation for reference.






