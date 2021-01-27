FROM civisanalytics/datascience-python

WORKDIR /workdir/
COPY * /workdir/

RUN pip install -r requirements.txt