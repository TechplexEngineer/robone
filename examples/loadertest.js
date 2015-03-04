
//example showing how to load library

require('coffee-script/register');
require('./lib/Loader.coffee')();

// var s = new Solenoid(1);

new SpeedController(1).set(0);
new SpeedController(2).set(0);
new SpeedController(3).set(0);
new SpeedController(4).set(0);
new SpeedController(5).set(0);
new SpeedController(6).set(0);
new SpeedController(7).set(0);

// new SpeedController(1).set(0);

