Built with:  
[![](https://skillicons.dev/icons?i=django)](https://skillicons.dev)
[![](https://skillicons.dev/icons?i=docker)](https://skillicons.dev)
[![](https://skillicons.dev/icons?i=postgres)](https://skillicons.dev)

## Overview
This is the first iteration of my personal website. I chose Django for two reasons, the first being to extend my knowledge of Python on the front end. My other reason was I wanted to use a frontend framework that was clean and data-driven. The dev and prod environments are encapsulated in Docker containers.  

You can view it [here](https://jacob-hollis.com)

## System Requirements
- latest version of Python
- Docker and Docker Compose
- (Optional) Venv
    - I used this for initial testing, but you can only use Docker, which I recommend.

## Forking this repo (please read!)
In case you are wondering, you are free to  use this code for your own website, but with attribution.

I know the value of keeping my site open source, especially given the sparse documentation of Docker Django deployments, but as you all know, plagiarism is a no no. I spent a significant amount of time and effort building and designing this, and it can be disheartening to see it copied without credit. All I ask of you all is to not claim this effort as your own.

Please also note that this is not a boilerplate project. I did not intend this to be a starter project, so if you have questions about implementation, please refer to other Django docs/tutorials.

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
        - Postgres database records are imported via csv
        - this command runs a script (load.py) to copy the data from csv to database, so only run if you have new data or you rebuilt the container
- I used [this](https://londonappdeveloper.com/django-docker-deployment-with-https-using-letsencrypt/) documentation to help me get set up with the deployment process.





