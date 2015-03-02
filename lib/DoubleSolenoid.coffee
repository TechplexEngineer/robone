
Solenoid = require('./Solenoid.coffee')

class DoubleSolenoid
	
	consructor: (@fwd_port, @rev_port) ->
		@fwd = new Solenoid(@fwd_port);
		@rev = new Solenoid(@rev_port);
	
	set: (dir) ->
		if (dir == "fwd")
			@rev.set(false);
			@fwd.set(true);
		else if (dir == "rev")
			@fwd.set(false);
			@rev.set(true);
		else
			@fwd.set(false);
			@rev.set(false);
			
			
module.exports = DoubleSolenoid