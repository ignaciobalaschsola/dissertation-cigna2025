# Directories
SRC_DIR = "src"
BUILD_DIR = "build"
TEMPLATE_DIR = ../phd-thesis-template  # Adjust path as needed

# Main LaTeX file
MAIN_TEX = $(BUILD_DIR)/anexob.tex
OUTPUT_PDF = $(BUILD_DIR)/anexob.pdf

# File extensions to clean
CLEAN_EXTENSIONS = aux log bbl blg toc out synctex.gz lof lot fls fdb_latexmk

# Default target
all: prepare build

# Prepare build directory
prepare:
	mkdir -p $(BUILD_DIR)
	rsync -av --exclude='*.pdf' $(SRC_DIR)/ $(BUILD_DIR)/
	@if [ -d "$(TEMPLATE_DIR)" ]; then \
		rsync -av --exclude='*.pdf' "$(TEMPLATE_DIR)/" "$(BUILD_DIR)/phd-thesis-template/"; \
	else \
		echo "Warning: $(TEMPLATE_DIR) does not exist. Skipping template sync."; \
	fi

# Build PDF
build:
	pdflatex -output-directory=$(BUILD_DIR) $(MAIN_TEX)
	bibtex $(BUILD_DIR)/anexob
	pdflatex -output-directory=$(BUILD_DIR) $(MAIN_TEX)
	pdflatex -output-directory=$(BUILD_DIR) $(MAIN_TEX)

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	find $(BUILD_DIR) -type f \( $(foreach ext,$(CLEAN_EXTENSIONS), -name '*.$(ext)') \) -delete

# Purge build directory completely
purge: clean
	@echo "Purging build directory..."
	rm -rf $(BUILD_DIR)

.PHONY: all prepare build clean purge