#!/bin/bash

ls -1 -d -- /dev/sd*[a-z][0-9] /dev/sd*[a-z] | cut -d"/" -f3 ; ls -1 -d -- /dev/hd*[a-z] /dev/hd*[a-z][0-9] 2> /dev/null | cut -d"/" -f3 



