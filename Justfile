build name:
    SOURCE_DATE_EPOCH=0 docker buildx build --no-cache -t {{name}} --build-arg=SOURCE_DATE_EPOCH=0 .

diffbuild:
    just build oracle
    docker save oracle > /tmp/one.tar
    just build oracle
    docker save oracle > /tmp/two.tar
    diffoscope --html /tmp/report.html /tmp/one.tar /tmp/two.tar
    xdg-open /tmp/report.html
