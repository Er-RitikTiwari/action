# FROM python:3.9

# WORKDIR /app/backend

# COPY requirements.txt /app/backend
# RUN pip install -r requirements.txt

# COPY . /app/backend

# EXPOSE 8000

# CMD python /app/backend/manage.py runserver 0.0.0.0:8000
FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Copy only requirements first (improves caching)
COPY requirements.txt . 
RUN pip install --no-cache-dir -r requirements.txt  # Avoids storing unneeded cache

# Now copy the rest of the application
COPY . .  

# Expose the application port
EXPOSE 8000

# Start the Django server (add --noreload to ensure changes are applied)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000", "--noreload"]
