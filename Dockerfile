FROM python:3.7-alpine
RUN python -m pip install --upgrade pip
RUN pip install pipenv
COPY Pipfile* /tmp/
RUN cd /tmp && pipenv lock --requirements > requirements.txt
RUN pip install -r /tmp/requirements.txt
COPY . /tmp/myapp
WORKDIR /tmp/myapp
CMD python manage.py runserver 0.0.0.0:8000