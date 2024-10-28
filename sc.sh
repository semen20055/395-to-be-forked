#!/bin/bash

echo "Введите название проекта:"
read project_name

echo "Введите путь к директории, где создать проект:"
read directory

mkdir -p $directory/$project_name/src/scripts
mkdir -p $directory/$project_name/src/styles
mkdir -p $directory/$project_name/src/images
touch $directory/$project_name/README.md
touch $directory/$project_name/.gitignore

echo "Структура проекта успешно создана в директории $directory/$project_name."
