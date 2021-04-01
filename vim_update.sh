#!/bin/bash
# cd you local copy of https://github.com/vim/vim

git checkout master && git pull;

latest=$(git tag -l --sort=-taggerdate | cat | awk 'NR==1{print $1}');

git checkout $latest;

make clean dist;

./configure \
    --enable-multibyte \
    --enable-terminal \
    --enable-python3interp \
    --enable-gui=no \
    --without-x \
    --with-python3-command=python3.7


make install
