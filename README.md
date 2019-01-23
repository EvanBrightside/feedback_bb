# FEEDBACK FORM

## Setup
* git clone `github.com/EvanBrightside/feedback_bb.git`
* bundle install
* cp config/database.yml.example config/database.yml
* rails db:setup
* rails db:migrate
* rails db:seed
* rails s

## Tech
* Ruby on Rails 5.2.2
* Ruby 2.6.0

## Usage
* localhost:3000

## Admin panel
* localhost:3000/admin
* login: `admin@admin.io`
* password: `123456`

## Tests
* bundle exec rspec spec
