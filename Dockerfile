FROM civisanalytics/datascience-python

WORKDIR /workdir/
COPY * /workdir/
COPY clearml.conf /root/

RUN pip install -r requirements.txt