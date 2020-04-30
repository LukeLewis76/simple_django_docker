FROM python:3.7-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN python -m pip install --upgrade pip
RUN pip install pipenv
COPY Pipfile* /code/
RUN cd /code && pipenv lock --requirements > requirements.txt
RUN pip install -r /code/requirements.txt
COPY . /code/
CMD python manage.py runserver 0.0.0.0:8000