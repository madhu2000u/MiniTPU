# Define the directories
SRC_DIR = processing_element
TB_DIR = tb
BUILD_DIR = work

# Define the source files
SRC_FILES = $(SRC_DIR)/*.sv
TB_FILE = $(TB_DIR)/*.sv

# Define the target
TARGET = tb_pe

# QuestaSim commands
VLOG = vlog
VSIM = vsim
VLIB = vlib
VOPT = vopt

# Build and simulate the design
all: compile simulate

# Create the build directory
$(BUILD_DIR):
	$(VLIB) $(BUILD_DIR)

# Compile the source and testbench files
compile: $(BUILD_DIR)
	$(VLOG) -work $(BUILD_DIR) $(SRC_FILES)
	$(VLOG) -work $(BUILD_DIR) $(TB_FILE)

# Optimize the design (optional)
optimize:
	$(VOPT) -work $(BUILD_DIR) $(TARGET) -o $(TARGET)_opt

# Run the simulation
simu:
	$(VSIM) -voptargs="+acc" -c $(BUILD_DIR).$(TARGET) -do "run -all; quit"

guisim:
	$(VSIM) -voptargs="+acc" $(BUILD_DIR).$(TARGET) -do "run -all; quit"

# Clean the build files
clean:
	rm -rf $(BUILD_DIR) transcript vsim.wlf

# Phony targets
.PHONY: all compile simulate clean optimize
