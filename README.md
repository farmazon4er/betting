betting rails app 
ruby 3.2.2
rails  7.0.4

to start 
docker-compose up --build
then 
bin/rails db:create
bin/rails db:migrate

to work pry 
docker-compose run --service-ports app