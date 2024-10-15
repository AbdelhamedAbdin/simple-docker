#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Activate the virtual environment
#source /website/venv/bin/activate

# Wait for MySQL to be ready
until mysql -h"$MYSQL_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e 'select 1'; do
  echo "Waiting for MySQL..."
  sleep 3
done

# Apply database migrations
python manage.py migrate

# Start the Django development server on 0.0.0.0:5000
exec python manage.py runserver 0.0.0.0:5000