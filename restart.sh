sudo docker-compose -f docker-compose.prod.yml down -v --rmi local && \
sudo docker-compose -f docker-compose.prod.yml up -d --build