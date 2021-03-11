SHELL := /bin/bash
PACHCTL := pachctl
KUBECTL := kubectl

all:
	python download_mnist.py --data_loacation ./data/
	$(PACHCTL) create repo data
	cd data && $(PACHCTL) put file -r data@master:/ -f ./MNIST/
	$(PACHCTL) create pipeline -f mnist.json

clean: 
	$(PACHCTL) delete pipeline mnist
	$(PACHCTL) delete repo data