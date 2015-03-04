
VALIDPINS = require('./PortMap.js').VALID;
_ = require('lodash')

class Util

	###*
	 * Set the output of a digital pin
	 * @param  {str } pin   BBB pin identifier
	 * @param  {bool} value true=high false=low
	 * @return {void}
	###
	@digitalSet: (pin, value) ->
		# if not _.contains(VALIDPINS, pin)
		# 	throw new Error("Invalid Pin");
		b.pinMode pin, b.OUTPUT, (err) ->
			if err
				console.log(err);
			else
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
	# @return {num}         the value remaped on the range [new_min new_max]
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
			return max
		else if value < min
			return min
		else
			return value

	###*
	 * Set the PWM of a pin based on a 50hz servo style protocol
	 * @param {str } pin     the BBB pin identifier
	 * @param {num } speed   a number on the range [-1,1] where -1=reverse 0=stopped 1=forward
	 * @param {obj } options motor controller options
	###
	@setPWM: (pin, speed, options) ->
		if not ( pin? and pin in VALIDPINS )
			throw new Error('Invalid pin: '+pin);

		speed = @constrain(-1, speed, 1)
		ton = @map(speed, -1, 1, 1e-3, 2e-3)
		freq = 50
		period = 1 / freq
		duty = ton / period

		b.pinMode pin, b.ANALOG_OUTPUT, (err) ->
			if err
				console.log err
			else
				b.analogWrite pin, duty, freq, (x) ->
					console.log pin, ton, freq, period, duty, x


module.exports = Util;