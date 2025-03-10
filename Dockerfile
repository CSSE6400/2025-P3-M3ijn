FROM python:latest

# Installing dependencies
RUN apt-get update && apt-get install -y pipx
RUN pipx ensurepath

# Install poetry
RUN pipx install poetry

# Setting the working directory
WORKDIR /app

# Install dependencies
COPY pyproject.toml ./
RUN pipx run poetry install --no-root

# Copy the application
COPY todo todo

# Run the Flask application
CMD ["bash", "-c", "sleep 10 && pipx run poetry run flask --app todo run --host 0.0.0.0 --port 6400"]
