FROM ubuntu:bionic

# Install required python & git packages
RUN apt-get update && apt-get install -y \
	python3.8-dev \
	python3-pip \
	python-setuptools \
	openssl \
	git

# Install python modules
RUN pip3 install paramiko paramiko-expect

# Delete all the apt list files to keep clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Create directory fir Git repos
RUN mkdir /git

# Change working directory
WORKDIR /git