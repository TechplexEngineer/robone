

var b = require('octalbonescript');
b.getPinMode("P9_14", printPinMux);
function printPinMux(err, data) {
    console.log(err, data);
}