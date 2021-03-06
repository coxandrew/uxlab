## Overview

UX Lab is an open source resource manager for collaborating on an application. Start by defining a project's features and user flows. Then add screens that show the visual workflow of all key user interactions within your application.

Upload sketches, wireframes, mockups or screenshots of your working application. UX Lab is ideal for organizing your thoughts and sharing ideas with team members. And it's completely free!

## Demo

You can check out a live demo of UX Lab at [uxlab.heroku.com](http://uxlab.heroku.com) and log in with:

    user: tronguy
    pass: tronguy

## Quickstart

If you want to start your own project locally, you can grab this project and start working almost immediately:

Fork this repository and then clone it:

    $ git clone git@github.com:<username>/uxlab.git

Make sure you're using Ruby 1.9.2 (there's an .rvmrc.example file if you're using rvm), and then just use Bundler to handle the gems:

    $ bundle install

Set up the database:

    $ rake db:reset

Copy the `s3.yml` config file and change the [Amazon S3 credentials](http://docs.heroku.com/s3) to match your access key ID and secret access key:

    $ cp config/s3.yml.example config.s3.yml

Start the server

    $ rails s

Now you should be able to log into your local version of UX Lab at the default Rails URL:

[http://localhost:3000/](http://localhost:3000/)

... with the default user of:

    username: admin
    password: password

## Hosting

The easiest way to get started with UX Lab is to fork the repository and host it on [Heroku](http://heroku.com/).

Create a user locally (either by modifying seeds.rb or using the console), for example:

    $ rails c
    ruby-1.9.2-p136 > User.destroy_all
    ruby-1.9.2-p136 > User.create(:username => "tronguy", :password => "tronguy", :password_confirmation => "tronguy")

Install the heroku gem:

    $ gem install heroku

Install the [taps](http://docs.heroku.com/taps) gem (for database management):

    $ gem install taps

Create a heroku app:

    $ heroku create

Push your app to Heroku:

    $ git push heroku master

Push your local database to Heroku:

    $ heroku db:push

Soon, there will be a cleaner way to create initial users and change passwords, but for now you will have to manage your initial users locally before pushing your local database to Heroku.

## License

(MIT License)

Copyright (c) 2011 Andrew Cox

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.