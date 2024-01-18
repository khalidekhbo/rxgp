FROM python:3.9-slim

WORKDIR /app

COPY serve.py .
COPY render.yaml .

RUN pip install gunicorn

CMD ["gunicorn", "serve:app", "--bind", "0.0.0.0:8000"]
