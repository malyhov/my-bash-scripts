#!/bin/bash
# Клонироние git репозиториев на bitbucket.org для бэкапа

TMP=/tmp
INTERNAL="ssh://git@bitbucket:7999/project"
EXTERNAL="ssh://git@bitbucket.org/username"

REPOS="repo1 repo2 repo3"

for REPO in ${REPOS}
do

    echo "########## Start sync ${REPO}"
    echo "***** Clone from bitbucket local"
    git clone --bare ${INTERNAL}/${REPO}.git ${TMP}/${REPO}
    cd ${TMP}/${REPO}
    echo "***** Push to bitbucket external"
    git push --mirror ${EXTERNAL}/${REPO}.git
    cd ..
    rm -rf ${TMP}/${REPO}
    echo ""
    echo ""
    echo ""

done

