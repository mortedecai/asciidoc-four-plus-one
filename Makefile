# Sample Makefile to build an Asciidoctor Four Plus One Architecture

ADOC_FILES := main.adoc development/view.adoc process/view.adoc logical/view.adoc physical/view.adoc scenarios/scenarios.adoc
EXTRA_FILES := development/sample.go logical/hello-state.puml

pdf: $(ADOC_FILES) $(EXTRA_FILES)
	@docker run --rm -v $(PWD):/documents/ asciidoctor/docker-asciidoctor asciidoctor-pdf -r asciidoctor-diagram main.adoc -o .documentation/four-plus-one.pdf

html: $(ADOC_FILES) $(EXTRA_FILES)
	@docker run --rm -v $(PWD):/documents/ asciidoctor/docker-asciidoctor asciidoctor -r asciidoctor-diagram main.adoc -o .documentation/four-plus-one.html

pages: html
	@docker run --rm -v $(PWD):/documents/ asciidoctor/docker-asciidoctor asciidoctor -r asciidoctor-diagram main.adoc -o gh_pages/index.html

all: pdf pages
