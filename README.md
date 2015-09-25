#About

* Weekend Challenge No. 4 for ["Maker's Academy Sweden."](http://www.makersacademy.se)
* "Completed" by one novice full-stack developer in one weekend. 
* See the finished product live on the web at [www.ohchit.herokuapp.com](https://ohchit.herokuapp.com/) (work in progress!).

#User Stories

```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

#Other Requirements

* Use BDD and TDD. 
* Users sign up to OhChit with email, password, name, and user name.
* Email and user name must be unique.
* Chits (posts to OhChit) show the Chitter's user name and when he or she created the Chit.
* Paswords are secured with bcrypt.
* DataMapper and PostgreSQL are used to persist data.
* Visitors to OhChit do not have to be logged in to see the stream of Chits.
* Users can only Chit if they are logged in.

#Notes on test coverage

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
Then run `open coverage/index.html` from the command line to view details


#TODO
* Update this README to indicate the technologies used and give instructions on how to install and run the tests.
* Submit a pull request before Monday at 9am with your solution or partial solution.

Please ensure you have the following **AT THE TOP** of your spec_helper.rb in order to have test coverage stats generated
#Bonus User Story

```ruby
In order to start a conversation as a Chitter I want to reply to a Chit from another Chitter.
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
#Bonus CSS
```

Note that you can replace `Coveralls.wear!` with  `SimpleCov.start` to get coverage stats locally
Polish this Chit and make it beautiful!
