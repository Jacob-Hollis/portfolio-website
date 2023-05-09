Built with Django  
[![](https://skillicons.dev/icons?i=django)](https://skillicons.dev)

## Overview
The dev and production environments are encapsulated in Docker containers. Thus, testing and deployments use Docker Compose.


## System Requirements
- latest version of Python
- Docker and Docker Compose
- (Optional) Venv
    - I used this for initial testing, but you can only use Docker, which I recommend.



## Deployment Steps
- I used an AWS EC2 Linux instance to host. You can use whatever cloud provider you wish provided it supports Docker images.
- Steps to deploy on instance:
    - clone from Github or pull changes once cloned
    - run "docker system prune -a"
        - this is just cleanup beforehand, but you can limit to the specific images/containers if you wish
    - run "docker-compose -f docker-compose.deploy.yml run --rm certbot /opt/certify-init.sh"
    - (Optional) run "docker-compose -f docker-compose.deploy.yml exec app python manage.py collectstatic --no-input --clear"
        - run this if you haven't collected static files yet
    - run "docker-compose -f docker-compose.deploy.yml down"
    - run "docker-compose -f docker-compose.deploy.yml up -d"
        - use the -d prefix to run detached, although not strictly necessary
    - (Optional) run "docker-compose -f docker-compose.deploy.yml exec app python manage.py runscript load"
        - database records are imported via csv
        - this command runs a script to copy the data from csv to database, so only run if you have new data or you rebuilt the container
- I used [this](https://londonappdeveloper.com/django-docker-deployment-with-https-using-letsencrypt/) documentation to help me get set up with the deployment process.






