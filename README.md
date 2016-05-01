# TDC - Chat

A example of chat application showcasing the capabilities of Action Cable.

## Dependencies

To run this project you need to have:

* Ruby 2.3.0
* PostgreSQL
* Redis

## Setup the project

* Install the dependencies above
* `$ git clone git@github.com:karreiro/tdc-chat.git`
* `$ cd tdc-chat`
* `$ bin/setup`

## Starting the servers

* Run `./bin/setup`
* Open up a separate terminal and run: `rails s`
* One more terminal to run redis server: `redis-server`
* Visit `http://localhost:3000`
