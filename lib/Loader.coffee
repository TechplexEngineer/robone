

#loader code http://stackoverflow.com/questions/5364928/node-js-require-all-files-in-a-folder
path = require("path");

console.time "OBS"
global.b = require('octalbonescript');
console.timeEnd "OBS"

module.exports = (dir) ->
	dir = '.' if not dir
	normalizedPath = path.join(__dirname, dir);
	thisFile = path.basename(__filename);

	require("fs").readdirSync(normalizedPath).forEach (file) ->
		if (file != thisFile && (path.extname(file) == ".coffee" || path.extname(file) == ".js") )
			classname = path.basename(file, path.extname(file))
			global[classname] = require(path.join(normalizedPath, file));
		return
