pins = require('./PortMap.js').PWM;
util = require('./Util.coffee');
_ = require('lodash');


class SpeedController

	options = {
		min: 1e-3,
		deadbandMin: undefined,
		disabled: 1.5e-3,
		deadbandMax: undefined,
		max: 2e-3
	};

	constructor: (@port, opt) ->
		_.merge(@options, opt)

	set: (speed) ->
		util.setPWM(pins(@port), speed, @options);

module.exports = SpeedController