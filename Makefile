BUILD_DIR = ./build

VFLAGS = -cc -trace --exe --build -j 8

VSRC=./top.v
CSRC=./main.cpp

build:
	@verilator $(VFLAGS) \
	--top-module top \
	--Mdir $(BUILD_DIR) \
	-sv \
	$(VSRC) $(CSRC) \

sim:
	$(BUILD_DIR)/Vtop

clean:
	rm -rf ./build