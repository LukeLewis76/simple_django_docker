#FROM python:3.7-alpine
#ENV PYTHONUNBUFFERED 1
#RUN mkdir /code
#WORKDIR /code
#RUN python -m pip install --upgrade pip
#RUN pip install pipenv
#COPY . /code/
#RUN pipenv install
#CMD python manage.py runserver 0.0.0.0:8000

FROM python:3.7-alpine
RUN python -m pip install --updgrade pip
RUN pip install pipenv
COPY Pipfile* /tmp/
RUN cd /tmp && pipenv lock --requirements > requirements.txt
RUN pip install -r /tmp/requirements.txt
COPY . /tmp/myapp
RUN pip install /tmp/myapp
CMD python manage.py runserver 0.0.0.0:8000