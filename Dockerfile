FROM ubuntu:focal

# Prevents the installer from opening dialog boxes 
ENV DEBIAN_FRONTEND=noninteractive

# Install required python & git packages
RUN apt-get update && apt-get install -y \
	python3.9-dev \
	python3-pip \
	python-setuptools \
	openssl \
	git && \
	# Delete all the apt list files to keep clean
	apt-get clean && rm -rf /var/lib/apt/lists/*

# Install python modules
RUN pip3 install paramiko paramiko-expect pyyaml

# Create directory fir Git repos
RUN mkdir /git

# Change working directory
WORKDIR /git