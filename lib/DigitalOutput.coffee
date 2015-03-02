
pins = require('./PortMap.js').DO;

class DigitalOutput

	constructor: (@port) ->
		@b = require('bonescript');
		
	set: (value) ->
		pin = pins(@port);
		@b.pinMode(pin, @b.OUTPUT);
		
		if value
			@b.digitalWrite(pin, @b.HIGH);
		else
			@b.digitalWrite(pin, @b.LOW);
			
module.exports = DigitalOutput