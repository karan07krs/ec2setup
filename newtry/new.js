const { spawn } = require('child_process');
var express = require('express');
var app = express();
app.listen(3000);
app.get('/', (req, res) => {
	    spawn('bash', ['./terrarun.sh']);
        res.send("Downloading your file on ec2 instances");
});

