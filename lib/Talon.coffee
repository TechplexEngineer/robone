

class Talon extends SpeedController

	constructor: (@port, @options) ->
		super(@port, @options);
		
module.exports = Talon