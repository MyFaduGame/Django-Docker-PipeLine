# Use an official Python runtime as the base image
FROM python:3.10

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app
RUN apt-get update

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project code into the container
COPY . /app

#RUN apt-get update && apt-get install libgdal-dev -y
# Expose the port that Gunicorn will listen on
EXPOSE 8000

#COPY .env /app/.env
 
# Specify the command to run when the container starts
CMD [ "python","django_docker/manage.py","runserver","0.0.0.0:8000" ]
# CMD ["sh", "-c", "cd django_docker/ && python -m dotenv run  gunicorn --config /app/gunicorn.conf.py --workers 10 --bind 0.0.0.0:8000 visionx.wsgi:application"]
