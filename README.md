#About

* Weekend Challenge No. 4 for [Maker's Academy Sweden.](http://www.makersacademy.se)
* "Completed" by one novice full-stack developer in one weekend.
* See the finished product live on the web at [www.ohchit.herokuapp.com](https://ohchit.herokuapp.com/) (work in progress!).

#User Stories

```
As a Registered User
So that I can post messages on OhChit as me
I want to sign up for OhChit

As a Registered User
So that I can post messages on OhChit as me
I want to sign in to OhChit

As a Registered User
So that I can avoid others posting messages on OhChit as me
I want to sign out of OhChit

As a Registered User
So that I can let people know what I am doing
I want to post a message (chit) to OhChit

As a Registered User
So that I can see what others are saying
I want to see all chits in reverse chronological order

As a Registered User
So that I can better appreciate the context of a chit
I want to see the time at which it was made
```

#Other Requirements

* Use BDD and TDD.
* Registered Users sign up to OhChit with email, password, name, and user name.
* Email and Registered user name must be unique.
* Chits (posts to OhChit) show the OhChit's registered user name and when he or she created the Chit.
* Passwords are secured with bcrypt.
* DataMapper and PostgreSQL are used to persist data.
* Visitors to OhChit do not have to be logged in to see the stream of Chits.
* Registered Users can only Chit if they are logged in.

#Notes on Test Coverage Reporting

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated on your pull request:

```ruby
require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
```

Note that you can replace `Coveralls.wear!` with  `SimpleCov.start` to get coverage stats locally
Then run `open coverage/index.html` from the command line to view details.

#Key Technologies Used

* [DataMapper](http://datamapper.org/)
* [Foundation CSS](http://foundation.zurb.com/)
* [Git](https://git-scm.com/)
* [GitHub](https://github.com/)
* [Heroku](https://www.heroku.com/)
* [PostgreSQL](http://www.postgresql.org/)
* [Ruby](https://www.ruby-lang.org/en/)
* [Sinatra](http://www.sinatrarb.com/)

#TODO

Update this README to give instructions on how to install and run the tests.

#Bonus Registered User Story

```
As a Registered User
In order to start a conversation on OhChit
I want to reply to a Chit from another OhChit.
```

#Bonus CSS

Polish this Chit and make it beautiful.

#LoFi Mockups (v1)

![alt tag](https://raw.githubusercontent.com/chrisco/chitter-challenge/master/README-LoFi-Mockups.jpg)
