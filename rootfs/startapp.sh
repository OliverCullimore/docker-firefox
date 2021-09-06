#!/usr/bin/with-contenv sh

set -e # Exit immediately if a command exits with a non-zero status.
set -u # Treat unset variables as an error.

export HOME=/config
mkdir -p /config/profile
firefox --version
if [ "$KIOSK_MODE" == "1" ]
then
  echo "Running with Kiosk Mode enabled\n"
  exec /usr/bin/firefox_wrapper --kiosk --profile /config/profile --setDefaultBrowser >> /config/log/firefox/output.log 2>> /config/log/firefox/error.log
else
  echo "Running with Kiosk Mode disabled\n"
  exec /usr/bin/firefox_wrapper --profile /config/profile --setDefaultBrowser >> /config/log/firefox/output.log 2>> /config/log/firefox/error.log
fi