#!/bin/sh

echo "I was called with $# parameters"
echo "My name is $0"
echo "My first parameter is $1"
# shellcheck disable=SC2145
echo "All parameters are $@"
