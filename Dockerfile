FROM python:3.10-alpine

ENV PYTHONUNBUFFERED 1

COPY requirements.txt /requirements.txt
RUN apk add --upgrade --no-cache build-base linux-headers && \
    pip install --upgrade pip && \
    apk add --update --no-cache postgresql-client && \
    apk add --update --no-cache --virtual .tmp-deps \
        build-base postgresql-dev musl-dev && \
    pip install -r /requirements.txt && \
    apk del .tmp-deps

RUN adduser --disabled-password --no-create-home django

RUN mkdir -p /vol/web/static && \
    chown -R django /vol && \
    chmod -R 755 /vol

COPY website/ /website
WORKDIR /website

USER django

CMD ["uwsgi", "--socket", ":9000", "--workers", "4", "--master", "--enable-threads", "--module", "website.wsgi"]