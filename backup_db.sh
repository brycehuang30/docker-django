# Backup command, generate a database backup archive and put it in $(pwd)/backup/
sudo docker run --rm -v docker-django_postgres_data:/dbdata -v $(pwd)/backup:/backup postgres:12.0-alpine tar cvf /backup/backup_db.$(date "+%Y-%m-%d_%H:%m:%S").tar /dbdata

# Use following command to restore/apply backup.
# I recommand not to make it a script, because it is a dangerous operation (overwrite the whole database)
# Template:
# sudo docker run --rm -v <volume_name>:/dbdata $(pwd):/backup ubuntu:latest bash -c "cd /dbdata && tar xvf /backup/<backup_filename> --strip 1"
#
# Example:
# sudo docker run --rm -v docker-django_postgres_data:/dbdata $(pwd):/backup postgres:12.0-alpine bash -c "cd /dbdata && tar xvf /backup/backup.2020-08-20_03\:08\:06.tar --strip 1"