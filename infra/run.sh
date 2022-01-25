#bin/bash

# Make Dummy Files
touch ../storage/logs/access.log
touch ../storage/logs/error.log
cp ../.env.example ../.env

# Container Build & Run
docker-compose --project-name "boilerplate" up -d

# Composer Package Install
containerID=$(docker-compose --project-name "boilerplate" ps -q web)
docker exec $containerID bash -c "cd /var/www; /bin/composer.phar install"
docker exec $containerID bash -c "cd /var/www; php artisan route:clear"
docker exec $containerID bash -c "cd /var/www; php artisan key:generate"
