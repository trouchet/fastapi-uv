# Use an official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements and install dependencies
RUN pip install uv

# Copy app files
COPY . .

# Install FastAPI and other dependencies
RUN uv sync

# Copy app files
COPY main.py .

# Expose FastAPI default port
EXPOSE 8000

# Command to run FastAPI app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
