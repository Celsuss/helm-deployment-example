FROM python:3.9-slim
WORKDIR /app
COPY ./app /app
RUN pip install --no-cache-dir Flask requests
EXPOSE 3000
ENV FLASK_APP=app.py
CMD ["flask", "run", "--host=0.0.0.0", "--port=3000"]
