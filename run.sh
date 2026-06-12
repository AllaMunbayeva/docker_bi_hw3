#!/bin/bash

if [ "$1" = "build_generator" ]; then
  docker build -t data_generator ./generator

elif [ "$1" = "run_generator" ]; then
  docker run --rm -v "$(pwd)/data:/data" data_generator

elif [ "$1" = "create_local_data" ]; then
  mkdir -p local_data
  python generator/generate.py local_data

elif [ "$1" = "build_reporter" ]; then
  docker build -t data_reporter ./reporter

elif [ "$1" = "run_reporter" ]; then
  docker run --rm -v "$(pwd)/data:/data" data_reporter

elif [ "$1" = "structure" ]; then
  echo "Структура проекта:"
  find . -maxdepth 3 -type f

elif [ "$1" = "clear_data" ]; then
  rm -f data/*.csv
  rm -f data/*.html
  rm -f local_data/*.csv
  echo "Папка data очищена"

elif [ "$1" = "inside_generator" ]; then
  docker run -it --rm -v "$(pwd)/data:/data" data_generator sh

elif [ "$1" = "inside_reporter" ]; then
  docker run -it --rm -v "$(pwd)/data:/data" data_reporter sh

else
  echo "Неизвестная команда"
  echo "Доступные команды:"
  echo "./run.sh build_generator"
  echo "./run.sh run_generator"
  echo "./run.sh create_local_data"
  echo "./run.sh build_reporter"
  echo "./run.sh run_reporter"
  echo "./run.sh structure"
  echo "./run.sh clear_data"
  echo "./run.sh inside_generator"
  echo "./run.sh inside_reporter"
fi