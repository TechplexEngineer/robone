
pins = {
	PWM: {
		1: 'P9_14',
		2: 'P9_16',
		3: 'P9_21',
		4: 'P9_22',
		5: 'P9_42',
		6: 'P8_13',
		7: 'P8_19',

	}, // should be in the format pin:BBBPin 1:P9_14
	SOLENOID: {},
	DO: {
		1:'P8_10'
	},
	DI: {},
	AI: {},
	RELAY: {},
	VALID: [] // list of all valid BBB pin strings
};

for(var o in pins.PWM) {
    pins.VALID.push(pins.PWM[o]);
}
for(var o in pins.DO) {
    pins.VALID.push(pins.DO[o]);
}


module.exports = exports = {};

exports.lookup = function(number, type){
	return pins[type][number];
};

exports.PWM = function(number) {
	return exports.lookup(number, 'PWM')
};

exports.SOLENOID = function(number) {
	return exports.lookup(number, 'SOLENOID')
}

exports.DO = function(number) {
	return exports.lookup(number, 'DO')
}

exports.DI = function(number) {
	return exports.lookup(number, 'DI')
}

exports.AI = function(number) {
	return exports.lookup(number, 'AI')
}

exports.RELAY = function(number) {
	return exports.lookup(number, 'RELAY')
}

exports.VALID = pins.VALID;