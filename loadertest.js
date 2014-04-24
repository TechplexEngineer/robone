
//example showing how to load library

require('coffee-script/register');
require('./lib/Loader.coffee')();

// var s = new Solenoid(1);

var mc1 = new SpeedController(1);
mc1.set(0);
