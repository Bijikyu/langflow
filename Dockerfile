# Use a stable Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git curl build-essential && \
    rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
ENV PATH="/root/.local/bin:$PATH"

# Clone Langflow repo (you can change this to your fork if needed)
RUN git clone https://github.com/logspace-ai/langflow.git .

# Install Python dependencies (no dev deps)
RUN poetry config virtualenvs.create false \
    && poetry install --only main

# Set environment variables for Langflow
ENV LANGFLOW_PORT=7860
ENV PORT=7860

# Expose the port Langflow will run on
EXPOSE 7860

# Start Langflow when the container starts
CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "7860"]
