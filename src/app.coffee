configuration = require './configuration'
controllers = require './controllers'
helpers = require './helpers'
express = require 'express'
winston = require 'winston'

server = express.createServer()

configuration.apply server
controllers.apply server
helpers.apply server

server.listen server.set 'listening-port'
winston.log 'info', "Server listening on #{server.set 'listening-port'}"

module.exports = server
