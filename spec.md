# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - used corneal gem to start a blank sinatra project, used Sinatra::Base with my application_controller to use sinatra framework
- [x] Use ActiveRecord for storing information in a database - used rake commands to create migrations for ActiveRecord and established my connection in my config.ru file
- [x] Include more than one model class (e.g. User, Post, Category) - i have a User, an Album, and an Artist model.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has many Albums
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Album belongs to User
- [x] Include user accounts with unique login attribute (username or email) - User has both username and password
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - albums_controller has routes for new, update, delete, and show.
- [x] Ensure that users can't modify content created by other users - i user helper methods logged_in? and current_user to authenticate user and only allow editing if they should be able to
- [x] Include user input validations - use the bcrypt gem and password_digest along with the .authenticate menthod to validate user
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - use flash messages to display errors
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - in progress

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
