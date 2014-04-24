
b = require('bonescript');
valid = require('./PortMap.js').VALID;

class Util
		
	@digitalSet: (pin, value) ->
		if not _.contains(valid, pin)
			throw new Error("Invalid Pin");
		b.pinMode(pin, b.OUTPUT);
		
		if (value)
			b.digitalWrite(pin, b.HIGH);
		else
			b.digitalWrite(pin, b.LOW);
		
	###*
	# map a number from one range to another
	# @param  {num} value   the value to be mapped
	# @param  {num} old_min the minimum of value
	# @param  {num} old_max the maximum of falue
	# @param  {num} new_min the new minimum value
	# @param  {num} new_max the new maximum value
	# @return {num}         the falue remaped on the range [new_min new_max]
	###
	
	@map: (value, old_min, old_max, new_min, new_max) ->
	  (value - old_min) / (old_max - old_min) * (new_max - new_min) + new_min

	###*
	# constrain a number between an upper and lower bound
	# @param  {num} min   lower bound
	# @param  {num} value value to be constrained
	# @param  {num} max   upper bound
	# @return {num}       the constrained value
	###
	
	@constrain: (min, value, max) ->
	  if value > max
	    max
	  else if value < min
	    min
	  else
	    value

	@setPWM: (pin, speed, options) ->
		if
	  speed = @constrain(-1, speed, 1)
	  ton = @map(speed, -1, 1, 1e-3, 2e-3)
	  freq = 50
	  period = 1 / freq
	  duty = ton / period
	  console.log( pin, ton, freq, period, duty);
	  b.pinMode pin, b.OUTPUT
	  b.analogWrite pin, duty, freq, console.log
	  return

module.exports = Util;