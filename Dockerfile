FROM python:3.7-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN python -m pip install --upgrade pip
RUN pip install pipenv
COPY . /code/
RUN pipenv install
CMD python manage.py runserver 0.0.0.0:8000