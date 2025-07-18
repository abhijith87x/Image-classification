# Use Python 3.10 for compatibili
FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Copy only the requirements file first (better for Docker caching)
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install -r requirements.txt

# Copy the entire project after installing dependencies
COPY . .

# Expose the correct port
EXPOSE 10000

# Command to run the FastAPI app with Uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "10000"]
