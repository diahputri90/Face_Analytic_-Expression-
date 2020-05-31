FROM gcr.io/google-appengine/python
LABEL python_version=python3.6
RUN virtualenv --no-download /env -p python3.6

# Set virtualenv environment variables. This is equivalent to running
# source /env/bin/activate
ENV VIRTUAL_ENV /env
ENV PATH /env/bin:$PATH
RUN pip install --upgrade pip
RUN pip3 install --upgrade pip
ADD requirements.txt /app/
RUN pip3 install -r requirements.txt
ADD . /app/
CMD exec gunicorn -b:$PORT main:app
