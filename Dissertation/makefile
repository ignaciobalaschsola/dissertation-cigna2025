BUILD_DIR = build
SRC_DIR = src

# List of files to copy
FILES_TO_COPY = $(SRC_DIR)/thesis.tex $(SRC_DIR)/thesis-info.tex $(SRC_DIR)/phd-thesis-template/PhDThesisPSnPDF.cls
DIRS_TO_COPY = $(SRC_DIR)/Figs $(SRC_DIR)/Body $(SRC_DIR)/References

# LaTeX compilation command (adjust to your workflow)
LATEX_CMD = latexmk -xelatex -cd -output-directory=$(BUILD_DIR)

# Default target: build the thesis
all: setup compile

# Step 1: Create build directory and copy files
setup:
	mkdir -p $(BUILD_DIR)
	cp $(FILES_TO_COPY) $(BUILD_DIR)/
	cp -r $(DIRS_TO_COPY) $(BUILD_DIR)/

# Step 2: Compile in build directory
compile: setup
	$(LATEX_CMD) $(BUILD_DIR)/thesis.tex

# Clean-up: Remove build directory and all compiled files
purge:
	rm -rf $(BUILD_DIR)

.PHONY: all setup compile clean