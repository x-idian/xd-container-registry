FROM python:3.12-slim as builder

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc

RUN pip wheel --no-cache-dir --no-deps --wheel-dir /app/wheels ultralytics~=8.4.31 azureml-inference-server-http~=1.5.1


# final stage
FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /app/wheels /wheels

RUN pip install --no-cache /wheels/*
