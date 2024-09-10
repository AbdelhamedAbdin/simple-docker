#!/bin/bash
set -e  # Exit immediately if a command exits with a non-zero status

# Activate the virtual environment
source /website/venv/bin/activate

# Apply database migrations
python3 manage.py migrate

# Start the Django development server on 0.0.0.0:5000
exec python3 manage.py runserver 0.0.0.0:5000