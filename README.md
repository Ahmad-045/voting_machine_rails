
## Voting Machine
 A voting Machine Application that is made using ruby on rails frameword and postgresql as the database. It has a basic sign up/log in page where a user can log in and create new account as well. Admin can create or start the election. Only then a user is allowed to cast his/her vote in the system. Any user can apply for the candidateship. However, to completely become a candidate, His profile must be approved by the Admin. Admin will have the data of all the users, candidate as well as Halka. Admin can create or destory halka at any time. Admin can view the data of the votes that is given to a particular candidate plus total number of votes. After the election ends., Every voter and candidate can see the result of the election.

 * There are 3 user roles (admin, candidate, voter). By default.., Every new user is a voter. But he can chage his role to candidate as well by applying for the candidate-ship. However the admin will be seeded (as it is the project requirement).

Below is some rails specifc versions and instructions to run the project

### Ruby version <br />
 * The Ruby Version that is used in the development of this project is **v2.7.2** <br />
 * The Rails Version that is used in the development of this project is **v5.2** <br />

### Gem installed <br />
 * gem 'pg' -> A gem that is used to use postgresql in Rails Application <br />
 * gem 'figaro' -> A gem used for managing the environment Variables <br />
 * gem 'cloudinary' -> To use the cloud storage for image uploads, compatible with Rails native Active Storage <br />
 * gem 'kaminari' -> To use pagination <br />
 * gem 'devise' -> A state-of-the-art rails gem for user authentication in rails <br />
 * gem 'devise-devise-bootstrap-views' -> A helper gem that create the views of devise having bootstraped templates <br />
 * gem 'pundit' -> A gem that helps the developer to add authentication in the application using policy <br />
 * gem 'momentjs-rails' -> A rails gems that is helpful when dealing with the data and time things. <br />
 * gem 'rubocop' -> A gem that is helpful, and give suggestion to make our code as good and readable as possible in rails <br />

### Set Up Rails app <br />
 * Before running or installing the application on your system, make sure that you have installed all the important dependecies i.e., Ruby, Rails or bundler.<br />
 * Simply go to the root directory of the application and run the **bundle** command to install all the gem dependencies of the rails application. [ You can find all the gems (that are used in the application) in **GemFile** ] <br />
 * Use this command to run all the migration file. This will basically create the database, load the schema, and initialize it with the seed data. <br />
 >'bundle exec rake db:setup',
 * To give or check the **important credentials** such as for admin, for cloudinary (a cloud storage for image storage), Mailer username/passwords, you can create the enviroment variables in environment.rb file or can either use the **figaro gem** to create and access the environemnt variable using build-in ruby-on-rails hash 'ENV' (that will be created in application.yml file) <br /><br />

### Start the Application <br />

 * To start the Rails application, you can use the following command to run it.
  >bundle exec rails server<br />
 * You can find your app now by pointing you browser to https://localhost:3000. If everything worked, you can then start signing up or using the application.<br />
