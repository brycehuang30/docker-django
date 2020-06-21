# docker-django

## Development

### Setup environment
Need to setup `.env.dev` file under project root directory

You can configure it based on `.env.dev-sample`

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

### Update static files after frontend deployment
```
docker exec docker-django_web_1 python manage.py collectstatic --no-input
```

### Terminate under development mode
```
docker-compose down -v
```

## Production

### Setup environment
Need to setup `.env.prod` file under project root directory

You can configure it based on `.env.prod-sample`

Here is an exmaple, your should change the strings surrounded by \*\*
```
DEBUG=0
SECRET_KEY=**'YOUR_KEY'**
DJANGO_ALLOWED_HOSTS=localhost 127.0.0.1 [::1] **yourdomain.com**

SQL_ENGINE=django.db.backends.postgresql
SQL_DATABASE=django_postgres_prod
SQL_USER=**postgres_admin**
SQL_PASSWORD=**postgres_passwd**
SQL_HOST=db
SQL_PORT=5432
DATABASE=postgres
```

And for `.env.prod.db`

You can configure it based on `.env.prod.db-sample`
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

## Frontend

### HTML
HTML files should be put in `django-container/base_django/frontend/`

This pages can be visited via `http://yourdomain.com/path/to/your/file`

### SRCs
Other packed/translated frondend sources should be put in `django-container/base_django/frontend/static`

This sources can be access via `http://yourdomain.com/static/your_srouce_name`

### Vue configs
TBD.

## Reference
All of the settings are refering [this guide](https://testdriven.io/blog/dockerizing-django-with-postgres-gunicorn-and-nginx/)


## Troubleshooting

###  ERROR: Couldn't connect to Docker daemon at http+docker://localhost - is it running?
Q: When I run "docker-compose build" command, I got this:
```
ERROR: Couldn't connect to Docker daemon at http+docker://localhost - is it running?

If it's at a non-standard location, specify the URL with the DOCKER_HOST environment variable.
```

A: You should run the docker commands with "sudo", for example "sudo docker-compose build", if you encounter this error.

### Bad Request (400)
Q: While the docker-compose run successfully, I get Bad Request (400) when accessing my website(index.html) or static files

A: Check the .env.dev or .env.prod file. You might forget to change the default domain name "yourdomain.com" to your domain name. After changing the domain name, you can correctly accessing your frontend websites.
