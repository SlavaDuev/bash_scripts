#!/bin/bash

# Скрипт для сортировки файлов в папке по владельцам

# Проверка наличия аргумента - пути к директории
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

source_dir=$1

# Проверка существования директории
if [ ! -d "$source_dir" ]; then
    echo "Error: Directory $source_dir does not exist."
    exit 1
fi

# Создание директорий по владельцам и копирование файлов
echo "Sorting files in directory $source_dir"
for file in "$source_dir"/*; do
    if [ -f "$file" ]; then
        owner=$(stat -c "%U" "$file")
        owner_dir="$source_dir/$owner"
        mkdir -p "$owner_dir"
        cp "$file" "$owner_dir/"
        chown "$owner" "$owner_dir/$(basename "$file")"
    fi
done
echo "File sorting completed successfully."
