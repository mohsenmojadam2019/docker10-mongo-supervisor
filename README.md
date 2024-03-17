
## Base Nahang

### [doc Auth](http://212.33.202.4:8201/api/documentation#/)
### [doc Base](http://212.33.202.4:8202/api/documentation#/)
### [doc local Base](http://localhost:8202/api/documentation#/)
To run Docker, execute the following commands:
```
docker compose exec new-ms-base-laravel bash
docker compose exec new-ms-base-laravel php artisan optimize:clear

docker compose exec php-base bash
docker compose exec php-base php artisan optimize:clear
docker compose exec new-ms-base-laravel php artisan config:clear

nahang s
cd /data/new-services/nahang-base/
sudo git pull
sudo git checkout .
sudo git status
sudo git pull
sudo chmod 777 -R storage
sudo git config core.fileMode false

 docker exec -it  new-ms-base-laravel bash
```
```


