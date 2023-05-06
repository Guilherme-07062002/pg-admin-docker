#!/bin/bash

# Script para inicialização do container
if [ "$#" -gt 0 ]; then
    if [ $1 = "run" ]; then
        docker-compose up
    fi
fi