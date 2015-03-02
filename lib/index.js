
//loader code http://stackoverflow.com/questions/5364928/node-js-require-all-files-in-a-folder
var path = require("path");
var normalizedPath = path.join(__dirname);
var thisFile = path.basename(__filename);

require("fs").readdirSync(normalizedPath).forEach(function(file) {

	if (file !== thisFile && (path.extname(file) == ".coffee" || path.extname(file) == ".js") ) {
		require("./"+file);
	}
});