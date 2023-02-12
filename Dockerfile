FROM kong:latest

# LABEL description="Ubuntu + Kong 2.5.0"

USER root

# RUN apt update
RUN apk update && \
    apk add python3 py3-pip python3-dev musl-dev libffi-dev gcc g++ file make && \
    PYTHONWARNINGS=ignore pip3 install kong-pdk geopy

# RUN pip3 install kong-pdk

COPY ./configs/kong.conf /etc/kong/

USER kong
