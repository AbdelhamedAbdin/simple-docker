FROM ubuntu

WORKDIR /website

RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    curl \
    python3-dev \
    libpq-dev \
    postgresql \
    postgresql-contrib

RUN python3 -m venv venv

RUN . venv/bin/activate

COPY requirements.txt .

RUN venv/bin/pip install --upgrade pip

RUN venv/bin/pip install -r requirements.txt

COPY . .

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
