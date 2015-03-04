

// var pin = 'P8_10';

// var b = require('octalbonescript');

// b.pinMode(pin, b.OUTPUT, function(x) {
//     b.digitalWrite(pin, b.HIGH, function(x) {
//         console.log(x);
//     });
// });

var b = require('octalbonescript'); //load the library

var pin = 'P8_10'; //the pin to operate on

b.pinMode(pin, b.OUTPUT, function(err1) {
  if (err1) {
    console.log(err1); //output any error
    return;
  }
  b.digitalWrite(pin, b.LOW, function(err2) {
      if (err2) {
        console.log(err2); //output any error
        return;
      }
  });
});