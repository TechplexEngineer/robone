
// var b = require('octalbonescript'); //load the library

// var pin = 'P9_14'; //the pin to operate on
// var duty = .05;
// var freq = 50;

// function test(cb) {
// 	b.analogWrite (pin, duty, freq, function(x) {
// 		console.log(x);
// 		if (cb)
// 			cb(null);
// 	});
// }

// b.pinMode(pin, b.OUTPUT, function (err) {
// 	if (err)
// 		console.log (err);
// 	else {
// 		test(function(){
// 			test();
// 		})
// 	}
// });

var b = require('octalbonescript'); //load the library

var pin = 'P9_14'; //the pin to operate on
var duty = .05;
var freq = 50;

function test(cb) {
    b.pinMode(pin, b.ANALOG_OUTPUT, function (err) {
        if (err)
            console.log (err);
        else {
            b.analogWrite (pin, duty, freq, function(x) {
                console.log(x);
                if (cb)
                    cb(null);
            });
        }
    });
}
test(function(){
    test();
});