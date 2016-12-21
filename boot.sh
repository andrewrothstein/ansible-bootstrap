#!/bin/bash

if [ ! -e proxify.sh ]
then
    . proxify.sh
fi

export ANACONDA_VER=4.2.0
export ANACONDA_PLATFORM=Linux-x86_64
export ANACONDA_SH=Anaconda3-${ANACONDA_VER}-${ANACONDA_PLATFORM}.sh
export ANACONDA_MIRROR=https://repo.continuum.io/archive
export ANACONDA_SH_URL=${ANACONDA_MIRROR}/${ANACONDA_SH}

if [ ! -e /tmp/$ANACONDA_SH ]
then
    echo downloading Anaconda...
    wget \
	-O /tmp/$ANACONDA_SH \
	$ANACONDA_SH_URL 
fi

if [ ! -e ~/anaconda3 ]
then
    echo installing Anaconda...
    bash /tmp/$ANACONDA_SH -b
fi

echo Please include Anaconda in your PATH by updating your ~/.bash_profile with something like...
echo 'export PATH=~/anaconda3/bin:$PATH'

export PATH=~/anaconda3/bin:$PATH
if [ ! -e ~/anaconda3/envs/ansible ]
then
    echo creating the ansible conda env...
    conda env create -f=environment.yml -q -n ansible python=2.7
fi

echo Run 'source activate ansible' to enable the conda environment with Ansible therein
