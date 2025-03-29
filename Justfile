build name:
    docker build --timestamp=0 --no-cache --format docker -t {{name}} --env=SOURCE_DATE_EPOCH=0 --no-hostname .

diffbuild:
    just build oracle
    docker save oracle > /tmp/one.tar
    just build oracle
    docker save oracle > /tmp/two.tar
    diffoscope --html /tmp/report.html /tmp/one.tar /tmp/two.tar
    xdg-open /tmp/report.html
