.SILENT:
build:
	zip -9 -r game.love "src/" "gfx/" "./conf.lua" -x ".git/*" "README.md" "Makefile"

run:
	love game.love
