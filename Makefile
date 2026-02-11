.SILENT:
build:
	zip -9 -r game.love "main.lua" "src/" "gfx/" "conf.lua" -x ".git/*" "README.md" "Makefile" "src/README.md"

run:
	love game.love
