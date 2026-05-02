`timescale 1ns/1ps

`include "mem_if.sv"
`include "my_mem.sv"
`include "test.sv"

module top;

  logic clk;

  initial begin
    clk = 0;
    forever #50 clk = ~clk; // 10MHz clock
  end

  mem_if mem_bus(clk);

  my_mem dut(mem_bus);

  test tb(mem_bus);

endmodule
