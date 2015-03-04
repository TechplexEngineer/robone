// pins = {
// 	1: "P9_14",
// 	2: "P9_16"
// };
console.time('OBS');
var b = require('octalbonescript');
console.timeEnd('OBS');

console.time('BS');
var b2 = require('bonescript');
console.timeEnd('BS');

console.time('_');
var _ = require('lodash');
console.timeEnd('_');

console.time('REST');
// b.pinMode('P9_14', b.OUTPUT);
// b.analogWrite('P9_14', 0.7, 2000.0, printStatus);
// function printStatus(x) {
//     console.log('x.value = ' + x.value);
//     console.log('x.err = ' + x.err);
// }

/**
 * map a number from one range to another
 * @param  {num} value   the value to be mapped
 * @param  {num} old_min the minimum of value
 * @param  {num} old_max the maximum of falue
 * @param  {num} new_min the new minimum value
 * @param  {num} new_max the new maximum value
 * @return {num}         the falue remaped on the range [new_min new_max]
 */
function map(value, old_min, old_max, new_min, new_max) {
	return (value - old_min) / (old_max - old_min) * (new_max - new_min) + new_min;
}

/**
 * constrain a number between an upper and lower bound
 * @param  {num} min   lower bound
 * @param  {num} value value to be constrained
 * @param  {num} max   upper bound
 * @return {num}       the constrained value
 */
function constrain(min, value, max) {
	if (value > max)
		return max;
	else if (value < min)
		return min;
	else
		return value;
}

function setPWM(pin, speed) {
	
	speed = constrain(-1, speed, 1);

	var ton = map(speed, -1, 1, 1e-3, 2e-3);
	
	var freq = 50;
	var period = 1/freq;
	var duty = ton/period;
	// console.log(ton, freq, period, duty);
	b.pinMode(pin, b.OUTPUT);
	b.analogWrite(pin, duty, freq, console.log);
	
}
setPWM('P9_14', 0);
console.timeEnd('REST');