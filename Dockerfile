FROM python:3.7-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN python -m pip install --upgrade pip
RUN pip install pipenv
COPY Pipfile* /code/
RUN pipenv shell && pipenv install
COPY . /code/
CMD python manage.py runserver 0.0.0.0:8000