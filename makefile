####################################
#            Constants             #
####################################

-include _project

OUTPUT_DIR = out

# Config
MANIFEST = manifest.mf
OBJECT_DIR = bin
SOURCE_DIR = src
COMP_CLASS = javac
COMP_JAR = jar

# Macros
JFLAGS = cfm
CFLAGS = -sourcepath $(SOURCE_DIR) -d $(OBJECT_DIR)

OUTPUT_FULL = $(OUTPUT_DIR)/$(OUTPUT_NAME).jar





####################################
#             Commands             #
####################################

# Default command
default: build

# Files
-include _objs

# Build command
build: init build_all
	@$(COMP_JAR) $(JFLAGS) $(OUTPUT_FULL) $(MANIFEST) -C $(OBJECT_DIR) .
	@echo "Build finished with success."
	@echo "You can find the resulting file at : "$(OUTPUT_FULL)

# Release mode
release: build
	
# Clean/Clear command
clean:
	@rm -f $(OUTPUT_FULL)
	@rm -f -r $(OBJECT_DIR)
	@echo "Cleaned, ready for a new build."
clear: clean
	
# Help
help:
	@echo "Commands : make [CMD]"
	@echo "With [CMD] option :"
	@echo "   * build [DEFAULT]"
	@echo "   * clean/clear"
	
run:
	@java -jar $(OUTPUT_FULL)

	
####################################
#           Compilations           #
####################################

init:
	@echo "Compiling..."
	@rm -f $(OUTPUT_FULL)
	@mkdir -p $(OBJECT_DIR)
	@mkdir -p $(OUTPUT_DIR)
	
build_all: build_objs
