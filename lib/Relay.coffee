pins = require('./PortMap.js').SOLENOID;

class Relay

	constructor: (@port) ->

	set: (dir) ->
		if (dir == "fwd")
			#@todo
		else if (dir == "rev")
			#@todo
		else
			#@todo