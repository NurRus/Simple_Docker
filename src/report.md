## Simple Docker
(Введение в докер. Разработка простого докер-образа для собственного сервера)

## Contents:

## [Part1. Готовый докер](#part-1-готовый-докер)
## [Part2. Операции с контейнером ](#part-2-операции-с-контейнером)
## [Part3. Мини веб-сервер](#part-3-мини-веб-сервер)
## [Part4. Свой докер](#part-4-свой-докер)
## [Part5. Dockle](#part-5-dockle)
## [Part6. Базовый Docker Compose](#part-6-базовый-docker-compose)


## Part 1. Готовый докер
### Возьми официальный докер-образ с **nginx** и выкачай его при помощи `docker pull`.
![simple_docker](images/image1.png)

### Проверь наличие докер-образа через `docker images`.
![simple_docker](images/image2.png)

### Запусти докер-образ через `docker run -d [image_id|repository]`.
![simple_docker](images/image3.png)

### Проверь, что образ запустился через `docker ps`.
![simple_docker](images/image4.png)

### Посмотри информацию о контейнере через `docker inspect [container_id|container_name]`.
![simple_docker](images/image5.png)

### По выводу команды определи и помести в отчёт размер контейнера, список замапленных портов и ip контейнера.
#### размер контейнера:
![simple_docker](images/image6.png)

#### список замапленных портов
![simple_docker](images/image7.png)

#### ip контейнера:
![simple_docker](images/image8.png)

### Останови докер образ через `docker stop [container_id|container_name]`.
![simple_docker](images/image9.png)

### Проверь, что образ остановился через `docker ps`.
![simple_docker](images/image10.png)

### Запусти докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду *run*.
![simple_docker](images/image11.png)

### Проверь, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**.
![simple_docker](images/image12.png)

### Перезапусти докер контейнер через `docker restart [container_id|container_name]`.
### Проверь любым способом, что контейнер запустился.
![simple_docker](images/image13.png)


## Part 2. Операции с контейнером

Докер-образ и контейнер готовы. Теперь можно покопаться в конфигурации **nginx** и отобразить статус страницы.

**== Задание ==**

### Прочитай конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*.
![simple_docker](images/image14.png)

### Создай на локальной машине файл *nginx.conf*.
### Настрой в нем по пути */status* отдачу страницы статуса сервера **nginx**.
![simple_docker](images/image15.png)

### Скопируй созданный файл *nginx.conf* внутрь докер-образа через команду `docker cp`.
### Перезапусти **nginx** внутри докер-образа через команду *exec*.
![simple_docker](images/image16.png)

### Проверь, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**.
![simple_docker](images/image17.png)

### Экспортируй контейнер в файл *container.tar* через команду *export*.
![simple_docker](images/image18.png)

### Останови контейнер.
![simple_docker](images/image19.png)
![simple_docker](images/image20.png)

### Удали образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры.
![simple_docker](images/image21.png)

### Удали остановленный контейнер.
![simple_docker](images/image22.png)

### Импортируй контейнер обратно через команду *import*.
![simple_docker](images/image23.png)

### Запусти импортированный контейнер.
![simple_docker](images/image24.png)
### Проверь, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**.
![simple_docker](images/image25.png)

- В отчёт помести скрины:
  - вызова и вывода всех использованных в этой части задания команд;
  - содержимое созданного файла *nginx.conf*;
  - страницы со статусом сервера **nginx** по адресу *localhost:80/status*.

## Part 3. Мини веб-сервер

Теперь стоит немного оторваться от докера, чтобы подготовиться к последнему этапу. Время написать свой сервер.

**== Задание ==**

### Пишeм мини-сервер на **C** и **FastCgi**, который будет возвращать простейшую страничку с надписью `Hello World!`.
![simple_docker](images/image26.png)

###  Проверяем наличие образа **nginx**, запускаем контейнер на порт 81
![simple_docker](images/image27.png)

###  Создаём свой *nginx.conf*, который будет проксировать все запросы с 81 порта на *127.0.0.1:8080*.
![simple_docker](images/image28.png)

###  Копируем в контейнер файл приложения *mini_server.c* и *nginx.conf* 
![simple_docker](images/image29.png)

###  Внутри контейнера обновляем репозитории и устанавливаем gcc, spawn-fcgi и libfcgi-dev
![simple_docker](images/image30.png)

###  Компилируем
![simple_docker](images/image31.png)

### Запускаем написанный мини-сервер через *spawn-fcgi* на порту 8080.
![simple_docker](images/image32.png)

### Проверь, что в браузере по *localhost:81* отдается написанная тобой страничка.
![simple_docker](images/image33.png)

### Положи файл *nginx.conf* по пути *./nginx/nginx.conf* (это понадобится позже).
![simple_docker](images/image34.png)


## Part 4. Свой докер

Теперь всё готово. Можно приступать к написанию докер-образа для созданного сервера.
![simple_docker](images/process.png)


**== Задание ==**

### Напиши свой докер-образ, который:
#### 1) собирает исходники мини сервера на FastCgi из [Части 3](#part-3-мини-веб-сервер);
#### 2) запускает его на 8080 порту;
#### 3) копирует внутрь образа написанный *./nginx/nginx.conf*;
#### 4) запускает **nginx**.
![simple_docker](images/image35.png)
![simple_docker](images/image36.png)
![simple_docker](images/image37.png)

### Собери написанный докер-образ через `docker build` при этом указав имя и тег.
### Проверь через `docker images`, что все собралось корректно.
![simple_docker](images/image38.png)
![simple_docker](images/image39.png)

### Запусти собранный докер-образ с маппингом 81 порта на 80 на локальной машине и маппингом папки *./nginx* внутрь контейнера по адресу, где лежат конфигурационные файлы **nginx**'а (см. [Часть 2](#part-2-операции-с-контейнером)).
![simple_docker](images/image40.png)

### Проверь, что по localhost:80 доступна страничка написанного мини сервера.
![simple_docker](images/image41.png)
![simple_docker](images/image42.png)

### Допиши в *./nginx/nginx.conf* проксирование странички */status*, по которой надо отдавать статус сервера **nginx**.
![simple_docker](images/image43.png)

### Перезапусти докер-образ.
### Проверь, что теперь по *localhost:80/status* отдается страничка со статусом **nginx**
![simple_docker](images/image44.png)
![simple_docker](images/image45.png)

## Part 5. **Dockle**

После написания образа никогда не будет лишним проверить его на безопасность.

Dockle — инструмент для проверки безопасности образов контейнеров, который можно использовать для поиска уязвимостей. Кроме того, с его помощью можно выполнять проверку на соответствие Best Practice, чтобы убедиться, что образ действительно создаётся на основе сохраненной истории команд.

**== Задание ==**

### Скачивание и установка dockle
![simple_docker](images/image46.png)

### Просканируй образ из предыдущего задания через `dockle [image_id|repository]`.
#### Ошибки
![simple_docker](images/image48.png)
![simple_docker](images/image49.png)

#### Исправил Dockerfile
![simple_docker](images/image50.png)


### Теперь при проверке через **dockle** нет ошибок и предупреждений.
![simple_docker](images/image51.png)


## Part 6. Базовый **Docker Compose**

### Docker Compose — это инструментальное средство, входящее в состав Docker. Оно предназначено для решения задач, связанных с развёртыванием проектов.Технология Docker Compose, если описывать её упрощённо, позволяет, с помощью одной команды, запускать множество сервисов.

![simple_docker](images/d-comp.png)

**== Задание ==**

#### Для начала узнаем версию docker-compose.
![simple_docker](images/image52.png)

#### создадим в корне проекта файл *docker-compose.yml*, с помощью которого поднимем докер-контейнер из [Части 5] (он должен работать в локальной сети) и новый докер-контейнер с **nginx**, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера.
![simple_docker](images/image53.png)

#### Настроим nginx.conf второго контейнера.
![simple_docker](images/image54.png)

#### Настроим Dockerfile второго контейнера.
![simple_docker](images/image55.png)
![simple_docker](images/image56.png)

#### Остановим все запущенные контейнеры.
![simple_docker](images/image57.png)

#### Соберём проект с помощью команд *docker-compose build*
![simple_docker](images/image58.png)

#### Запусти проект с помощью команды *docker-compose up*
![simple_docker](images/image59.png)

#### Проверим, что в браузере по *localhost:80* отдается написанная страничка, как и ранее.
![simple_docker](images/image60.png)


## THE END.