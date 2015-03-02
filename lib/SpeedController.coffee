pins = require('PortMap.js').PWM;




class SpeedController

	options = {
		min: 1e-3,
		deadbandMin: undefined,
		disabled: 1.5e-3,
		deadbandMax: undefined,
		max: 2e-3
	};

	constructor: (@port, @options) ->
		_.merge(@options, options)
		@b = require('bonescript');
	
	set: (speed) ->
		@setPWM(pins(@port), speed);
		
		
	setPWM: (pin, speed) ->
		ton = 1.5e-3;
		
		freq = 50;
		period = 1/freq;
		duty = ton/period;
		console.log(ton, freq, period, duty);
		b.pinMode(pin, b.OUTPUT);
		b.analogWrite(pin, duty, freq, console.log);
	
module.exports = SpeedController