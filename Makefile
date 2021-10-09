
# -no-shell-escape: disable latexmk executing arbitrary shell commands in latex files

FILE_NAME=expose

pdf:
	docker container run --rm -it --mount type=bind,src="$(PWD)",destination=/home my-latex make generate-pdf

generate-pdf: clean
	latexmk -halt-on-error \
					-file-line-error \
					-no-shell-escape \
					-pdf \
					-silent \
					-output-directory=output \
					$(FILE_NAME)

debug:
	docker container run --rm -it --mount type=bind,src="$(PWD)",destination=/home my-latex make generate-pdf-verbose

generate-pdf-verbose: clean
	latexmk -halt-on-error \
					-file-line-error \
					-no-shell-escape \
					-pdf \
					-output-directory=output \
					$(FILE_NAME)

clean:
	rm -rf output
