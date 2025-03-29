build output:
    docker buildx rm mybuilder
    docker buildx create --name mybuilder --driver docker-container --use
    SOURCE_DATE_EPOCH=0 docker buildx build --provenance=false -o type=docker,dest={{ output }},rewrite-timestamp=true .

diffbuild:
    just build /tmp/one.tar
    just build /tmp/two.tar
    diffoscope --html /tmp/report.html --output-empty /tmp/one.tar /tmp/two.tar
    xdg-open /tmp/report.html
