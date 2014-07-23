**Helpdesk application**

For details, plz see specifications in doc/ folder

*Configuration*

Application is using MySQL database.


DB name: 'helpdesc_development'
DB user: root

1. Run bundle exec rake db:create db:migrate db:seed. Seeds add default users and other essential data
2. To run tests, first clone test database, via db:test:prepare