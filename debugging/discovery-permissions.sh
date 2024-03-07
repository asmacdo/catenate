#!/bin/bash

set -eu

set -x

nfs4_getfacl .

git config annex.thawcontent-command
git config annex.freezecontent-command

which datalad
datalad --version

# there might be difference if some 'git' from e.g. conda hijacks
# git-annex which is later in the PATH
which git
which git-annex
git annex version --raw; echo
git-annex version --raw; echo

datalad create -D "teeeeest" test-ds
cd test-ds/
touch hello.world
datalad save

datalad install -d . --source ///repronim/containers code/containers

