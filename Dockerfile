# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Config python utf8
RUN sed  -i 's+encoding = "ascii"+encoding = "utf8"+g' /usr/local/lib/python2.7/site.py

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Make Site
RUN pykwiki cache -f
RUN cp src/* docroot/ -r
RUN pykwiki cache -f

# Make port 5000 available to the world outside this container
EXPOSE 80

WORKDIR /app/docroot/

# Run app.py when the container launches
CMD ["python", "-m", "SimpleHTTPServer", "80"]