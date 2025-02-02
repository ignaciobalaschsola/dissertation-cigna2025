.PHONY: all anexob dissertation clean purge

# Default target (shows usage instructions)
all:
	@echo "Usage:"
	@echo "  make anexob           # Build Anexo B"
	@echo "  make dissertation     # Build Dissertation"
	@echo "  make clean anexob     # Clean Anexo B auxiliary files"
	@echo "  make clean dissertation # Clean Dissertation auxiliary files"
	@echo "  make purge anexob     # Purge Anexo B (clean + remove build directory)"
	@echo "  make purge dissertation # Purge Dissertation"

# Build targets
anexob:
	$(MAKE) -C "Anexo B" all

dissertation:
	$(MAKE) -C Dissertation all

# Clean targets
clean:
ifeq ($(TARGET), anexob)
	$(MAKE) -C "Anexo B" clean
else ifeq ($(TARGET), dissertation)
	$(MAKE) -C Dissertation clean
else
	@echo "Specify target to clean: make clean TARGET=anexob or make clean TARGET=dissertation"
endif

# Purge targets
purge:
ifeq ($(TARGET), anexob)
	$(MAKE) -C "Anexo B" purge
else ifeq ($(TARGET), dissertation)
	$(MAKE) -C Dissertation purge
else
	@echo "Specify target to purge: make purge TARGET=anexob or make purge TARGET=dissertation"
endif