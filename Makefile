BUILD_DIR = ./build
VFLAGS = -cc -trace --exe --build -j 8

TOP ?= top
VTOP =  V$(TOP)

CSRC = $(shell find ./csrc -name '*.cpp' -or -name '*.c')
VSRC = $(shell find ./vsrc -name '*.v' -or -name '*.sv')

$(VTOP):
	@echo "====================== CSRC ======================"
	@echo $(CSRC)
	@echo "====================== VSRC ======================"
	@echo $(VSRC)
	@echo "====================== END  ======================"
	@verilator $(VFLAGS) \
	--top-module $(TOP) \
	--Mdir $(BUILD_DIR) \
	-sv \
	$(VSRC) $(CSRC) \

sim: $(VTOP)
	$(BUILD_DIR)/$(VTOP)

clean:
	rm -rf ./build