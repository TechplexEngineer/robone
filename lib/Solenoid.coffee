
pins = require('./PortMap.js').SOLENOID;

class Solenoid

	constructor: (@port) ->
		@b = require('bonescript');
		
		
	set: (value) ->
		pin = pins(@port)
		@b.pinMode(pin, @b.OUTPUT);
		
		if (value)
			@b.digitalWrite(pin, @b.HIGH);
		else
			@b.digitalWrite(pin, @b.LOW);
			