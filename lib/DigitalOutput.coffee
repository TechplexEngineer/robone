
pins = require('./PortMap.js').DO;

class DigitalOutput

	constructor: (@port) ->

	set: (value) ->
		pin = pins(@port);
		console.log(pin, value);
		b.pinMode pin, b.OUTPUT, (err)->
			if err
				console.log(err);
			else
				if value
					b.digitalWrite(pin, b.HIGH);
				else
					b.digitalWrite(pin, b.LOW);

module.exports = DigitalOutput