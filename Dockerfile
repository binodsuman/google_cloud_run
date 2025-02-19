# Use a Python base image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# The EXPOSE instruction is not strictly required for port mapping to work, but it's highly recommended.  
# It makes things clearer and helps tools like Docker Desktop.
EXPOSE 8080

# Specify the command to run when the container starts
# Gunicorn is a popular WSGI Server for Flask
# thread -> Gunicorn create 4 worker threads. Each thread can handle a
# seperate incoming request. This allow your Flask application to handle
# upto 4 request concurrenlty.

#app:app -> module:attribute -> First is app.py and second flask instance
# name 'flaskApp' in app.py
CMD ["gunicorn", "--bind", ":8080", "--threads", "4", "app:flaskApp"]