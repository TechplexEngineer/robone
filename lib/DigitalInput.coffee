pins = require('./PortMap.js').DI;

class DigitalInput

	constructor: (@port) ->

	get: () ->
		pin = pins(@port)
		b.pinMode(pin, b.INPUT);
		b.digitalRead pin, (x) ->
		    console.log('x.value = ' + x.value);
		    console.log('x.err = ' + x.err);
		   #@todo async work here

module.exports = DigitalInput