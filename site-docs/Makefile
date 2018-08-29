all: index

index: index.md
	mkdir -p ./output
	pandoc --self-contained --css ./css/pandoc.css --from=markdown --to=html --output ./output/index.html ./index.md

clean:
	rm -rf ./output
