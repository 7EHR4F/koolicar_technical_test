# README

Technical test for Koolicar as backend rails developer

* You need a redis server running on your localhost (config is in config/cable.yml in case you want to change it).

* The start_.sh script is handling everything else, including killing previous instance of puma and starting the worker for delayed_job.

* Start app with : sh start_app.sh

* You don't need a separate DBMS, the test is using sqlite3.

* Execute tests with : rails tests

# koolicar_technical_test
