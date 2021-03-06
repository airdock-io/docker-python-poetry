FROM python:3.6-slim

ENV HOME=/usr/local/lib

COPY poetry-entrypoint.sh /usr/local/bin/poetry-entrypoint

RUN apt-get update && apt-get install --no-install-recommends -y curl \
    && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python \
    && rm -rf /var/lib/apt/lists/* \
    && chmod +x /usr/local/bin/poetry-entrypoint

ENV PATH=$HOME/.poetry/bin:$PATH

WORKDIR /app

ENTRYPOINT ["poetry-entrypoint"]

CMD ["poetry", "--help"]