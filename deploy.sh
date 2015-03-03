#!/bin/sh

# run this once
#heroku create staging-aspenrise
#git remote add heroku git@heroku.com:staging-aspenrise.git
git push heroku master
# if working out of develop
#git push heroku develop:master
heroku open
heroku run rake db:migrate
# better to create custom rake task

# heroku run rake populator:reset