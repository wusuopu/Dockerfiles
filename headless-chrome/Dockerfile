FROM alpine:3.17

RUN apk add --no-cache chromium
COPY ./fonts/ /usr/share/fonts

EXPOSE 9222

CMD chromium-browser --headless --no-sandbox --remote-debugging-port=9222 --remote-debugging-address=0.0.0.0 --mute-audio --incognito --disable-background-timer-throttling --disable-client-side-phishing-detection --disable-default-apps --disable-dev-shm-usage --disable-hang-monitor --disable-extensions --disable-breakpad --disable-popup-blocking --disable-prompt-on-repost --disable-sync --disable-translate --disable-gpu --metrics-recording-only --no-first-run --safebrowsing-disable-auto-update
