
## BonchIktPractice
Практика БОНЧ-2020
## Ваша команда мечты
Иванов Игорь
Кравцов Николай
Несговоров Михаил
## Кто что делал
| Фамилия | Вклад |
| ------------- | ------------- |
| Иванов | Написание python приложения, написание dockerfile|
| Кравцов | Работа с git, написание разбор с docker hub | 
| Несговоров | Написание docker-compose, помощь с деплоем приложения|
## Как запустить локально:
### 1 шаг
```bash
docker-compose build 
```
### 2 шаг
```bash
docker-compose up -d
```
Образ Python приложения, написанного на Flask, можно найти здесь [ТЫК](https://hub.docker.com/repository/docker/igivanov1728/python-db-image)
### 3 шаг
```bash
docker ps 
```
Результат должен быть следующий
```bash
CONTAINER ID        IMAGE                              COMMAND                  CREATED             STATUS                    PORTS                    NAMES
17ac10f23533        igivanov1728/python-db-image:1.8   "/bin/sh -c '/bin/sh…"   16 minutes ago      Up 16 minutes             0.0.0.0:8080->8080/tcp   bonchiktpracticemain_web_1
4893e3cf4d8a        postgres:10.6                      "docker-entrypoint.s…"   40 minutes ago      Up 40 minutes (healthy)   5432/tcp                 postgres_db
```

## Как проверить
### Через rest-api
#### 1 - выполнить curl POST
```bash
curl localhost:8080/api/v1/users -X POST -d '{"firstName":"Kirill","lastName":"Eduardovich"}' --header "Content-Type: application/json"
```
#### 2 - выполнить curl GET
```bash
curl localhost:8080/api/v1/users/2
```
Ответ должен быть следующий:
```json
{
  "user": {
    "firstName": "Kirill",
    "id": 2,
    "lastName": "Eduardovich"
  }
}
```
### Подключиться к БД postgress

Для этого необходимо изменить файл docker-compose.yml
Добавив 
```yaml
ports:
 5432:5432
```

