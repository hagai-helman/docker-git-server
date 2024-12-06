FROM ubuntu
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y python3
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y git
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y lighttpd
RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y curl
RUN git config --system --add safe.directory '*'
COPY share/* /usr/share/git-server/
ENV PATH_INFO=/
ENTRYPOINT python3 /usr/share/git-server/start.py

