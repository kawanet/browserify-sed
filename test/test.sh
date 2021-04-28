#!/usr/bin/env bash

cd $(dirname $0)

FAIL() {
  echo "FAIL" >&2
  exit 1
}

# this should success
echo "__foo__"
../node_modules/.bin/browserify -t [ ../ "s#__FOO__#__foo__#g;" ] 10.foo.js --no-detect-globals | node || FAIL
echo "OK"

# this should fail
echo "__bar__"
../node_modules/.bin/browserify -t [ ../ "s#__FOO__#__bar__#g;" ] 10.foo.js --no-detect-globals | node && FAIL
echo "OK"
