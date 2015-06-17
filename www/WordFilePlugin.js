
	var exec = require("cordova/exec");
   
	var wordFilePlugin = function() {
	};
	
	wordFilePlugin.download = function(array) {
	    exec(null, null, "WordFilePlugin", "exportJjyxbg", array);
	};
	
	module.exports = wordFilePlugin;   


