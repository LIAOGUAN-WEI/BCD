VERILOG = iverilog
TARGET = simple.vcd
TEMP = temp.vvp
$(TARGET) : $(TEMP)
	vvp $(TEMP)
$(TEMP): BCD.v testbench.v
	$(VERILOG) -o $(TEMP) BCD.v testbench.v
clean:
	-del $(TARGET)
	-del $(TEMP)