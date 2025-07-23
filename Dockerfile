# Use Python base image, not langflow's prebuilt container
FROM python:3.10-slim

# Create app directory
WORKDIR /app

# Install OS dependencies
RUN apt-get update && apt-get install -y build-essential git

# Install poetry
RUN pip install poetry

# Clone Langflow source
RUN git clone https://github.com/logspace-ai/langflow.git /app

# Install Python dependencies
RUN poetry config virtualenvs.create false && poetry install --no-dev

# Set environment variables
ENV PORT=7860
EXPOSE 7860

# Run Langflow on 0.0.0.0
CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
