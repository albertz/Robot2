#!/bin/bash

for name in * ; do
	mv -i $name `echo $name | tr [A-Z] [a-z]`
done

