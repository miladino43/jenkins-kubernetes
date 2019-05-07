#!/bin/sh
set -ex

function generate_payload {
        cat <<eof > index.html
<!DOCTYPE html>
<html>
<head>
<title>Kube Api</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>My Payload</h1>
<p>My environment is DEV1</p>
<p>The git hash is $1</p>
<p>For online documentation and support please refer to
<br/>
The Readme for this repo is at 
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for your time.</em></p>
</body>
</html>
eof
}

function main() {
	generate_payload $1
}

main "$@"