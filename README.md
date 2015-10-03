Chitter
=======

About
------
This is a project made during my time at [Makers Academy Sweden](http://www.makersacademy.se/).
The challenge was to write a little Twitter clone that will allow the users to post messages to a public stream.
The "Chitter" application can be found live on the web at [www.chittergr.herokuapp.com](https://chittergr.herokuapp.com/).

Features / User Stories:
-------

```sh
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

Notes on functionality:
------

* You need to sign in as a user before you can post a Peep message in the public stream.
* Once signed in you can view your own Peep messages and update and delete them.
* At this moment there is no function for password retrival.


Technologies used
-----
* [Sinatra](http://www.sinatrarb.com/) - Web application
* [PostgreSQL](http://www.postgresql.org/) - Database
* [Foundation](http://foundation.zurb.com/) - CSS framework
* [Ruby](https://www.ruby-lang.org/en/) - Interpreted open source programming language
* [BCrypt](https://en.wikipedia.org/wiki/Bcrypt) - Password encryption
* [DataMapper](http://datamapper.org/) - A Ruby Object Relational Manager (ORM)
* [Git](https://git-scm.com/) - Version Control System (VCS)
* [GitHub](https://github.com/) - A tool for collaborative development using Git
* [Heroku](https://www.heroku.com/) Platform as a service (PaaS) that enables developers to build and run applications entirely in the cloud.
* [Capybara](https://github.com/jnicklas/capybara) - Web application test framework
* [RSpec](http://rspec.info/) - Test driven development (TDD) framework for Ruby
* [Travis CI](https://travis-ci.org/) - Automated test framework
* [Coveralls](https://coveralls.io/) - Ensure that all your new code is fully test-covered.

Ideas on future improvements
----------------------
* Add a password retrival function.
* Add a reply-function.
* Add search/filtering function.
* Add a upper limit for number of messages showed on a page in order to maintain page speed.

How to get the code and run Tests
---------------------------------

1) Clone this repo to your local machine.
2) Run Bundle install
3) Run RSpec and Capybara tests in spec folder

How to run the application on your local machine
---------------------------------
1) Follow the steps above.
2) Start web server using Shotgun or rackup.
3) Open http://localhost:(webserver port) in your browser.

Notes on test coverage
----------------------
In this project i have been using Travis CI and Coveralls as automated test frameworks. Statistics below:


[![Build Status](https://travis-ci.org/gustafr/chitter-challenge.svg?branch=master)](https://travis-ci.org/gustafr/chitter-challenge)
[![Coverage Status](https://coveralls.io/repos/gustafr/chitter-challenge/badge.svg?branch=master&service=github)](https://coveralls.io/github/gustafr/chitter-challenge?branch=master)

