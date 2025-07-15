FROM python:3.7-slim-buster as builder

WORKDIR /app

COPY python_project/requirements.txt ./
RUN pip install -r requirements.txt

COPY . ./

ENV FLASK_DEBUG=1
ENV PYTHONDONTWRITEBYTECODE=1

RUN chmod +x /app/manage.py

CMD ["python", "manage.py", "runserver", "--port", "8080"]
