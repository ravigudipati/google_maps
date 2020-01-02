# README

# How to run the api

curl localhost:3000/api/v1/maps?customer='CustomerA'

curl localhost:3000/api/v1/maps?customer='CustomerB'

curl localhost:3000/api/v1/maps?customer='CustomerC'


# Handling errors

404 : curl localhost:3000/api/v1/maps

# How to run the test suite

rspec spec/lib/maps_search_spec.rb
