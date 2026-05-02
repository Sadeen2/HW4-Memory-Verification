interface mem_if(input logic clk);

  logic        write   = 0;
  logic        read    = 0;
  logic [7:0]  data_in = 0;
  logic [15:0] address = 0;
  logic [8:0]  data_out;

  always @(posedge clk) begin
    assert (!(read && write))
      else $error("[%0t] ERROR: read and write are active at the same time", $time);
  end

  clocking cb @(posedge clk);
    output write;
    output read;
    output data_in;
    output address;
    input  data_out;
  endclocking

  modport dut_mp (
    input  clk,
    input  write,
    input  read,
    input  data_in,
    input  address,
    output data_out
  );

endinterface
