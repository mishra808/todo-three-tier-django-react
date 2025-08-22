# Build Stage

FROM python:3.12 AS build

# Set the working directory
WORKDIR /app

# Set environment variable to prevent Python from writing .pyc files to disk
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 

COPY requirements.txt /app/

# Install the dependencies and upgrade pip
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Runtime Stage

FROM python:3.12-slim

#Creating User and ownership of app folder
RUN useradd -m -r appuser && \
   mkdir /app && \
   chown -R appuser /app

# Set the working directory
WORKDIR /app

# Copy only the Python packages and app files from the build stage
COPY --from=build /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

# Copy application code
COPY --chown=appuser:appuser . .

# Set environment variable for Python
ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

# Switch to non-root user
USER appuser

# Expose the application port
EXPOSE 8000

RUN chmod +x /app/entrypoint.sh

# Set the entrypoint to start the application
ENTRYPOINT ["sh", "entrypoint.sh"]