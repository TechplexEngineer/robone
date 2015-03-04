console.time('BS');
var b2 = require('bonescript');
console.timeEnd('BS');


console.time('OBS');
var b = require('octalbonescript');
console.timeEnd('OBS');


console.time('_');
var _ = require('lodash');
console.timeEnd('_');