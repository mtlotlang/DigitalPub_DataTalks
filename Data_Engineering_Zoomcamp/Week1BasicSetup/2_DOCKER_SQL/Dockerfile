FROM python:3.9

#RUN pip install pandas
RUN apt-get install wget
RUN python -m pip install --upgrade pip
RUN pip install psycopg2-binary
RUN pip install pandas sqlalchemy psycopg2==2.9.1 
#ENTRYPOINT ["bash"]
# the /workdir/path
WORKDIR /app
COPY ingest_data.py ingest_data.py

#ENTRYPOINT [ "bash"]
 ENTRYPOINT [ "python","ingest_data.py"]