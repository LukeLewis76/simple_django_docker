FROM python:3.7-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN python -m pip install --upgrade pip
COPY . /code/
RUN pip install -p Pipfile
CMD python manage.py runserver 0.0.0.0:8000