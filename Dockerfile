FROM ibmcom/db2:latest

RUN useradd -u 1010 db2user

COPY create-db-fw.sql .
COPY createDB.sh .
RUN chmod a+x ./createDB.sh 

COPY DB2-PORTAL.sql .
COPY DB2-FW.sql .
COPY Portal-Seed.sql .
COPY FW-Seed.sql .

COPY lightwell-db2.sh .

RUN chmod a+x ./lightwell-db2.sh 

RUN chown -R db2user:db2user /opt
RUN chown db2user:db2user createDB.sh 
RUN chown db2user:db2user lightwell-db2.sh

RUN chown db2user:db2user DB2-PORTAL.sql
RUN chown db2user:db2user DB2-FW.sql
RUN chown db2user:db2user Portal-Seed.sql
RUN chown db2user:db2user FW-Seed.sql

USER 1010

ENV PATH="/opt/db2/bin:${PATH}"