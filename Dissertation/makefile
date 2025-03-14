BUILD_DIR = build
SRC_DIR = src

# List of files to copy
FILES_TO_COPY = \
	$(SRC_DIR)/thesis.tex \
	$(SRC_DIR)/thesis-info.tex \
	$(SRC_DIR)/phd-thesis-template/PhDThesisPSnPDF.cls \
	$(SRC_DIR)/phd-thesis-template/glyphtounicode.tex \
	$(SRC_DIR)/phd-thesis-template/.travis.yml \
	$(SRC_DIR)/phd-thesis-template/compile-thesis.sh

DIRS_TO_COPY = \
	$(SRC_DIR)/Figs \
	$(SRC_DIR)/Body \
	$(SRC_DIR)/References \
	$(SRC_DIR)/Extras \
	$(SRC_DIR)/phd-thesis-template/sty \
	$(SRC_DIR)/Appendices \
	$(SRC_DIR)/phd-thesis-template/hooks

# Default target: build the thesis
all: setup compile

# Step 1: Create build directory and copy files
setup:
	mkdir -p $(BUILD_DIR)
	cp $(FILES_TO_COPY) $(BUILD_DIR)/
	cp -r $(DIRS_TO_COPY) $(BUILD_DIR)/

# Step 2: Compile in build directory
compile: setup
	cd $(BUILD_DIR) && latexmk -xelatex thesis.tex

# Clean-up: Remove build directory and all compiled files
purge:
	rm -rf $(BUILD_DIR)

.PHONY: all setup compile clean