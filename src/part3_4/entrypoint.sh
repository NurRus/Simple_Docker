#!/bin/bash

gcc -o mini_server mini_server.c -lfcgi
spawn-fcgi -p 8080 ./mini_server
nginx -g "daemon off;"