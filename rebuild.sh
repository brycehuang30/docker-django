docker-compose -f docker-compose.prod.yml down -v --rmi local && \
docker-compose -f docker-compose.prod.yml up -d --build
