SHELL := /bin/bash
PACHCTL := pachctl
KUBECTL := kubectl

all:
	$(PACHCTL) create repo config
	$(PACHCTL) put file config@master:/clearml.conf -f clearml.conf
	$(PACHCTL) create repo data
	$(PACHCTL) put file data@master:/empty.file -f empty.file
	$(PACHCTL) create pipeline -f mnist.json

clean: 
	$(PACHCTL) delete pipeline mnist
	$(PACHCTL) delete pipeline debug
	$(PACHCTL) delete repo config
	$(PACHCTL) delete repo data