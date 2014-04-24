pins = require('./PortMap.js').SOLENOID;

class Relay

	constructor: (@port) ->
		@b = require('bonescript');
		
	set: (dir) ->
		if (dir == "fwd")
			#@todo
		else if (dir == "rev")
			#@todo
		else
			#@todo