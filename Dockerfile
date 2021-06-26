# Build stage
# ***make cmd will give us "knapsack" binary executable
FROM debian:10.10 AS builder
ENV OS_VERSION=debian-10 \
  MAJOR_VERSION=v9.0 \
  MINOR_VERSION=9048
RUN apt-get update -y && \
    apt-get install -y build-essential zlib1g-dev && \
    apt-get install -y wget tar
COPY src .
RUN wget https://github.com/google/or-tools/releases/download/${MAJOR_VERSION}/or-tools_${OS_VERSION}_${MAJOR_VERSION}.${MINOR_VERSION}.tar.gz -O or-tools.tar.gz && \
  mkdir -p /or-tools && \
  tar -zxvf or-tools.tar.gz --strip-components 1 -C /or-tools && \
  make

# Start over, with lean image and only necessary stuffs e.g. backend code, lib, binary
FROM python:3.9-slim-buster
ENV LD_LIBRARY_PATH=/or-tools/lib
RUN mkdir -p /or-tools/lib /app/bin
COPY --from=builder /or-tools/lib/ /or-tools/lib/.
COPY --from=builder knapsack /app/bin/.
# Now, we can prepare flask app that able to call "knapsack" from /app/bin/knapsack
# WORKDIR /app
# COPY requirements.txt requirements.txt
# RUN pip3 install -r requirements.txt
# COPY my_backend_code/ /app/.
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
