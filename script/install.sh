#!/bin/bash

rake db:drop
rake db:create
rake db:migrate
psql -f script/db.sql management_system_dev postgres
rails r db/setup.rb
