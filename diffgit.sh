#!/bin/bash

diffgit () {
	tar xf $1
	cd dump
	cd ace
	for f in *.bson; do bsondump --outFile $f.json $f; done
	rm *.bson
	cd ./../ace_stat
	for f in *.bson; do bsondump --outFile $f.json $f; done
	rm *.bson
	cd ./../admin
	for f in *.bson; do bsondump --outFile $f.json $f; done
	rm *.bson
	cd ./../../
	git add dump
	git commit -m "$1"
	rm dump -r
}

for t in *.tar; do diffgit $t; done
