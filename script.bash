#!/bin/bash

# Скрипт для очистки директории от файлов с определенными расширениями

# Проверка наличия аргумента - пути к директории
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

directory=$1

# Проверка существования директории
if [ ! -d "$directory" ]; then
    echo "Error: Directory $directory does not exist."
    exit 1
fi

# Удаление файлов с расширениями .bak, .tmp, .backup
echo "Cleaning directory $directory"
find "$directory" -type f \( -name "*.bak" -o -name "*.tmp" -o -name "*.backup" \) -delete
echo "Cleanup completed successfully."
