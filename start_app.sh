#!/bin/sh
echo "You need to start a local redis server in order to use action_cable"
echo "service redis start OR /etc/init.d/redis start"
kill `pidof ruby`
bundle update
RAILS_ENV=development rake db:migrate
RAILS_ENV=development rails s -d
RAILS_ENV=development rake jobs:work

