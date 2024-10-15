FROM python:3.10

ENV PYTHONUNBUFFERED=1

WORKDIR /website

RUN apt-get update && apt-get install -y default-mysql-client

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
