FROM python:3.9-alpine

RUN addgroup --gid 1001 mygroup \
    && adduser -D -u 1001 -G mygroup myuser

WORKDIR /app

COPY . /app

USER myuser

EXPOSE 8000

CMD ["python", "-m", "http.server", "8000"]
