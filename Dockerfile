# Use a base image with Python installed
FROM python:3.9-slim

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Set the working directory
WORKDIR /app

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the current directory contents into the container
COPY . .

# Install dependencies (FastAPI and Uvicorn)
RUN pip install --no-cache-dir -r requirements.txt

# Expose the necessary ports (80 for Nginx and 8000 for Uvicorn)
EXPOSE 80
EXPOSE 8000

# Start Nginx and FastAPI app with Uvicorn
CMD nginx & uvicorn main:app --host 0.0.0.0 --port 8000



