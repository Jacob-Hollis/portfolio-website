FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1

#COPY requirements.txt /requirements.txt
#RUN apk add --upgrade --no-cache build-base linux-headers && \
#    pip install --upgrade pip && \
#    pip install -r /requirements.txt

#RUN adduser --disabled-password --no-create-home django

#RUN mkdir -p /vol/web/static && \
#    chown -R django /vol && \
#    chmod -R 755 /vol

#COPY website/ /website
#WORKDIR /website

#RUN python manage.py collectstatic --noinput

#USER django

#CMD ["uwsgi", "--socket", ":9000", "--workers", "4", "--master", "--enable-threads", "--module", "website.wsgi"]

COPY ./requirements.txt /requirements.txt
COPY ./app /app
COPY ./scripts /scripts

WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    apk add --update --no-cache --virtual .tmp-deps \
    /py/bin/pip install -r /requirements.txt && \
    apk del .tmp-deps && \
    adduser --disabled-password --no-create-home app && \
    mkdir -p /vol/web/static && \
    mkdir -p /vol/web/media && \
    chown -R app:app /vol && \
    chmod -R 755 /vol && \
    chmod -R +x /scripts

ENV PATH="/scripts:/py/bin:$PATH"

USER app

CMD ["run.sh"]