About the project
=================

[![Build Status](https://secure.travis-ci.org/monokrome/web-base-frontend.png?branch=master)](http://travis-ci.org/monokrome/web-base-frontend)

This project represents a basic frontend for me to use in order to
get CoffeeScript projects started relatively quickly. The default
configuration makes use of the following technologies, but switching
most things out is left to be a simple task:

- NodeJS
	* Coffee-Script
	* Express
	* Jade
	* Stylus
	* Connect-Assets
	* Nib
	* Uglify-JS
    * Winston
- Modernizr.js
- Respond.js

It is very easy to get started with the project. Assuming you have npm
installed (you should) you can simply run the following command in the
root directory of our repository:

    npm install

This should resolve all dependencies. Make sure that you've set the
environment variable **NODE_ENV** to **development**, and you should
be able to find a server running at **localhost:8000** by running the
following command:

    npm start


*NOTE:* If you do not set NODE_ENV="development" then the server will
assume that you are running it in production, and so it will run your
project on port 80 - which will fail unless you ran the server as root.
*Don't run the project as root.*

Architecture
============

The architecture of this project is made in a way that allows a
fair amount of flexibility while still providing good productivity,
and keeping it easy to get started with your frontend. Here is a
simple overview of what decisions have been made, and why they
have been made.

Deployment
==========

This project is automatically ready to be deployed to Nodejitsu,
Heroku, and No.de. If there are any services that it doesn't
support, and you are interested in supporting them - submit an
issue and we will look into setting it up.

Directory structure
-------------------

By default, static files are served from the following directory
structure.

- public/ contains all static files
- public/views/ contains our views for both server and client
- assets/scripts/ contains all unminified client-side script files
- assets/stylesheets/ contains .styl files for preprocessing CSS using Stylus syntax
- src/ contains all server-side source code
- src/server.js bootstarts coffee-script and requires ./src/app
- package.json describes package dependancies and other metadata
- .travis.yml provides the necessary configuration for travis-ci.org

Why are views shared between server & client?
---------------------------------------------

As web-based applications become more dynamic (yes, they will) it is important to
make sure that we are able to render views on both server and client.
Something that currently exists on the server may need to be on the client
some day - or vice versa.

There are many times where markup needs to exist on
both the client and server in order to provide graceful degradation. This allows
the server and client to share the same view in these cases, which result
in less changes as things get more complicated. With these reasons and many
others, it is best to keep your views in a shared location to avoid extra work - even if you don't expect that work.

This is a practice that is just part of good forward development. I figure at
this point - based on previous experience - that many people are sitting here
right now saying *but I don't want to give away my business logic*! I will
just add that if your business logic is in your views, you've got bigger
problems.

How do I use Stylus to pre-process my CSS files?
-----------------------------------------------

This project is automatically set up to do CSS pre-processing with [Stylus](http://learnboost.github.com/stylus/ "Stylus").
To use this functionality, you can put your Stylus code in *assets/stylesheets* and they will be rendered as CSS files into
public/stylesheets. For instance, you might set up your web application to request **/stylesheets/common.css** which would
be rendered using */assets/stylesheets/common.styl*. Stylesheets are rendered upon every request when
the server is running in a development environment.
