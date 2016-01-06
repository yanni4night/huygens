/**
 * Copyright (C) 2016 yanni4night.com
 * compile.js
 *
 * changelog
 * 2016-01-06[23:11:01]:revised
 *
 * @author yanni4night@gmail.com
 * @version 0.1.0
 * @since 0.1.0
 */
var fs = require('fs');

var targetFileName = process.argv[2];

new Promise(function(resolve, reject) {
    fs.readFile(targetFileName, {
        encoding: 'utf-8'
    }, function(err, content) {
        if (err) {
            reject(err);
        } else {
            resolve(content);
        }
    });
}).then(function(content) {

}, function(err) {
    console.error(err.message);
});