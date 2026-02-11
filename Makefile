.SILENT:
build:
	zip -9 -r game.love . -x ".git/*" "README.md" "Makefile"

run:
	love game.love
