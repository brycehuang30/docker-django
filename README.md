# docker-django

## Development

### Setup environment
Need to setup `.env.dev` file under project root directory
Here is an exmaple, your should change the strings surrounded by \*\*
```
DEBUG=1
SECRET_KEY=**'YOUR_KEY'**
DJANGO_ALLOWED_HOSTS=localhost 127.0.0.1 [::1]

SQL_ENGINE=django.db.backends.postgresql
SQL_DATABASE=django_postgres_dev
SQL_USER=**postgres_admin**
SQL_PASSWORD=**postgres_passwd**
SQL_HOST=db
SQL_PORT=5432
DATABASE=postgres
```


### Run under development mode
```
docker-compose up -d --build
```

### Terminate under development mode
```
docker-compose down -v
```

## Production


### Setup environment
Need to setup `.env.prod` file under project root directory
Here is an exmaple, your should change the strings surrounded by \*\*
```
DEBUG=0
SECRET_KEY=**'YOUR_KEY'**
DJANGO_ALLOWED_HOSTS=localhost 127.0.0.1 [::1]

SQL_ENGINE=django.db.backends.postgresql
SQL_DATABASE=django_postgres_prod
SQL_USER=**postgres_admin**
SQL_PASSWORD=**postgres_passwd**
SQL_HOST=db
SQL_PORT=5432
DATABASE=postgres
```

And for `.env.prod.db`
```
POSTGRES_DATABASE=django_postgres_prod
POSTGRES_USER=**postgres_admin**
POSTGRES_PASSWORD=**postgres_passwd**
```

### Run under production mode
```
# build and start
docker-compose -f docker-compose.prod.yml up -d --build

# setup database
docker-compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput

# collect static files, including http://host/admin files
docker-compose -f docker-compose.prod.yml exec web python manage.py collectstatic --no-input --clear
```

### Terminate under production mode
```
docker-compose -f docker-compose.prod.yml down -v
```

## Reference
All of the settings are refering [this guide](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)