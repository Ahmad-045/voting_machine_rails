# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  The Ruby Version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  --> The Ruby Version that is used in the development of this project is '2.7.2'
  --> The Rails Version that is used in the development of this project is '5.2'

* Gem installed
  --> gem 'pg' )-> a gem that is used to use postgresql in Rails Application
  --> gem 'figaro' )-> A gem used for managing the environment Variables
  --> gem 'cloudinary' )-> To use the cloud storage for image uploads, compatible with Rails native Active Storage
  --> gem 'kaminari' )-> To use pagination
  --> gem 'devise' )-> A state-of-the-art rails gem for user authentication in rails
  --> gem 'devise-devise-bootstrap-views' )-> A helper gem that create the views of devise having bootstraped templates
  --> gem 'pundit' )-> A gem that helps the developer to add authentication in the application using policy
  --> gem 'momentjs-rails' )-> A rails gems that is helpful when dealing with the data and time things.
  --> gem 'rubocop' )-> A gem that is helpful, and give suggestion to make our code as good and readable as possible in rails

* Set Up Rails app
  --> Before running or installing the application on your system, make sure that you have installed all the important dependecies i.e., Ruby, Rails or bundler.
  --> Simply go to the root directory of the application and run the 'bundle' command to install all the gem dependencies of the rails application. [ You can find all the gems (that are used in the application) in GemFile ]
  --> 'bundle exec rake db:setup', Use this command to run all the migration file. This will basically create the database, load the schema, and initialize it with the seed data.
  --> To give or check the important credentials such as for admin, for cloudinary (a cloud storage for image storage), Mailer username/passwords, you can create the enviroment variables in environment.rb file or can either use the figaro gem to create and access the environemnt variable using build-in ruby-on-rails hash 'ENV' (that will be created in application.yml file)

* Start the Application

  --> To start the Rails application, you can use the following command to run it.
  bundle exec rails server
  You can find your app now by pointing you browser to https://localhost:3000. If everything worked, you can then start signing up or using the application.
