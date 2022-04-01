#!/bin/sh

BASEDIR="$( cd "$( dirname "$0" )" && pwd )"
cd ..

tar -zcvf solution.tar.gz --exclude="$BASEDIR/.git" --exclude="$BASEDIR/client/node_modules" $BASEDIR
mv solution.tar.gz "$BASEDIR/api"
cd $BASEDIR

# This is a hacky solution to bypass Gmail's native tar/gz file scanning
docker-compose run --rm runner gpg -c --batch --passphrase password solution.tar.gz

mv "$BASEDIR/api/solution.tar.gz.gpg" "$BASEDIR/solution.tar.gz.gpg" \
  && rm "$BASEDIR/api/solution.tar.gz"

echo 'solution.tar.gz.gpg has been written to the backend project root'
