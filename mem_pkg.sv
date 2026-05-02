package mem_pkg;

  class Transaction;

    rand bit [15:0] address;
    rand bit [7:0]  data_in;

    bit [8:0] data_out;
    bit [8:0] expected_data;

    static int error = 0;

    function new();
      address = $urandom_range(0, 16'hFFFF);
      data_in  = $urandom_range(0, 8'hFF);
      expected_data = {^data_in, data_in}; // even parity bit + data
    endfunction

    function void print_data_out();
      $display("[%0t] data_out = %0h", $time, data_out);
    endfunction

    static function void print_error();
      $display("[%0t] Total errors = %0d", $time, error);
    endfunction

    function void check();
      if (data_out !== expected_data) begin
        error++;
        $display("[%0t] ERROR: addr=%0h expected=%0h actual=%0h",
                 $time, address, expected_data, data_out);
      end
      else begin
        $display("[%0t] PASS : addr=%0h expected=%0h actual=%0h",
                 $time, address, expected_data, data_out);
      end
    endfunction

    function Transaction deep_copy();
      Transaction copy;
      copy = new();

      copy.address       = this.address;
      copy.data_in       = this.data_in;
      copy.data_out      = this.data_out;
      copy.expected_data = this.expected_data;

      return copy;
    endfunction

  endclass

endpackage
