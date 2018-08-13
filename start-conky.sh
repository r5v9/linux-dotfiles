#!/bin/bash

# redirect stdout and stderr to logfile
exec >>~/tmp/conky.log 2>&1

conky -c ~/.conkyrc