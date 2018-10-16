FROM ubuntu:18.04
EXPOSE 7000
RUN apt-get update && apt-get install -y apt-utils 
RUN apt-get update && apt-get install -y python3 python3-pip git
RUN python3 -m pip install --upgrade "knowledge-repo[all]"
RUN git clone http://172.29.100.53:8580/opm/knowledge_repo.git
RUN knowledge_repo --repo /knowledge_repo init
COPY config.py .
#CMD "knowledge_repo --repo /knowledge_repo runserver"
CMD /bin/bash
