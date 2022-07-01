#!/bin/bash

function run(){
    make run;
}

function test(){
    echo 'Run tests...'
    TEST=y make test;
    echo 'Run tests down'
}

function clean(){
    echo 'Run clean...'
    TEST=y make clean;
    echo 'Run clean down'
}

case "$1" in
    '-c')
        clean;
    ;;
    '-r')
        run;
    ;;
    '-t')
        test;
    ;;
    *)
        test;
    ;;
esac