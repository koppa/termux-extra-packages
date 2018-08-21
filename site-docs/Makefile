all: index mirror extra

index: index.md
	mkdir -p ./output
	pandoc --self-contained --css ./css/pandoc.css --from=markdown --to=html --output ./output/index.html ./index.md

mirror: mirror.md
	mkdir -p ./output
	pandoc --self-contained --css ./css/pandoc.css --from=markdown --to=html --output ./output/mirror.html ./mirror.md

extra: extra.md
	mkdir -p ./output
	pandoc --self-contained --css ./css/pandoc.css --from=markdown --to=html --output ./output/extra.html ./extra.md

clean:
	rm -rf ./output
