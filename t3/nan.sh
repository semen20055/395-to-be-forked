#!/bin/bash

# Функция для создания структуры папок
create_course_structure() {
    read -p "Укажите название курса: " course_name
    course_dir="./$course_name"

    # Проверка на существование папки курса
    if [ -d "$course_dir" ]; then
        echo "Папка для курса '$course_name' уже существует."
    else
        mkdir "$course_dir"
        mkdir "$course_dir/Студенты"
        touch "$course_dir/Оценки.txt"
        echo "Структура папок для курса '$course_name' создана."
    fi

    # Запрос количества студентов
    read -p "Сколько студентов в группе? " student_count

    # Добавление студентов и их оценок
    for ((i = 1; i <= student_count; i++)); do
        read -p "Студент $i: " student_name
        read -p "Оценка для $student_name: " grade
        echo "Студент: $student_name, Оценка: $grade" >> "$course_dir/Оценки.txt"
    done

    echo "Оценки добавлены в файл 'Оценки.txt' для курса '$course_name'."
}

# Функция для редактирования оценок
edit_grades() {
    read -p "Укажите название курса для редактирования оценок: " course_name
    course_dir="./$course_name"

    # Проверка на существование папки курса
    if [ ! -d "$course_dir" ]; then
        echo "Папка для курса '$course_name' не найдена."
        return
    fi

    echo "Текущие оценки:"
    cat "$course_dir/Оценки.txt"

    read -p "Введите фамилию студента, чью оценку хотите изменить: " student_name
    read -p "Введите новую оценку для $student_name: " new_grade

    # Обновление оценок
    sed -i "s/Студент: $student_name, Оценка: .*/Студент: $student_name, Оценка: $new_grade/" "$course_dir/Оценки.txt"
    echo "Оценка для студента $student_name обновлена."
}

# Основное меню
while true; do
    echo "Выберите действие:"
    echo "1. Создать структуру папок для курса"
    echo "2. Редактировать оценки"
    echo "3. Выход"
    read -p "Ваш выбор: " choice

    case $choice in
        1) create_course_structure ;;
        2) edit_grades ;;
        3) exit 0 ;;
        *) echo "Некорректный выбор, попробуйте снова." ;;
    esac
done
