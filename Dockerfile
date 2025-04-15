FROM python:3.12-alpine

RUN apk add --no-cache \
    libxslt libxml2 \
    && apk add --no-cache --virtual .build-deps \
    gcc musl-dev libxslt-dev libxml2-dev \
    && pip install lxml setuptools \
    && apk del .build-deps

WORKDIR /src
COPY . /src
RUN pip install .

RUN rm -f /entrypoint.sh
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh", "-c", "/entrypoint.sh"]