`include "mem_pkg.sv"

program test(mem_if mem_bus);

  import mem_pkg::*;

  Transaction gen_q[$];
  Transaction exp_q[$];
  Transaction out_q[$];

  int NUM_TRANS = 20;

  task automatic reset_signals();
    mem_bus.cb.write   <= 0;
    mem_bus.cb.read    <= 0;
    mem_bus.cb.data_in <= 0;
    mem_bus.cb.address <= 0;
    repeat (3) @(mem_bus.cb);
  endtask

  task automatic generate_transactions();
    Transaction tr;

    for (int i = 0; i < NUM_TRANS; i++) begin
      tr = new();
      gen_q.push_back(tr.deep_copy());

      $display("[%0t] Generated: addr=%0h data_in=%0h expected=%0h",
               $time, tr.address, tr.data_in, tr.expected_data);
    end
  endtask

  task automatic drive_transactions();
    Transaction tr;

    while (gen_q.size() > 0) begin
      tr = gen_q.pop_front();

      mem_bus.cb.write   <= 1;
      mem_bus.cb.read    <= 0;
      mem_bus.cb.address <= tr.address;
      mem_bus.cb.data_in <= tr.data_in;

      repeat (2) @(mem_bus.cb);

      mem_bus.cb.write <= 0;
      mem_bus.cb.read  <= 0;

      exp_q.push_back(tr.deep_copy());

      @(mem_bus.cb);
    end
  endtask

  task automatic collect_output();
    Transaction tr;
    Transaction out_tr;

    while (exp_q.size() > 0) begin
      tr = exp_q.pop_front();

      mem_bus.cb.write   <= 0;
      mem_bus.cb.read    <= 1;
      mem_bus.cb.address <= tr.address;

      repeat (3) @(mem_bus.cb);

      out_tr = tr.deep_copy();
      out_tr.data_out = mem_bus.cb.data_out;
      out_q.push_back(out_tr.deep_copy());

      mem_bus.cb.read <= 0;

      @(mem_bus.cb);
    end
  endtask

  task automatic check_results();
    Transaction tr;

    while (out_q.size() > 0) begin
      tr = out_q.pop_front();
      tr.print_data_out();
      tr.check();
    end

    Transaction::print_error();
  endtask

  initial begin
    reset_signals();

    generate_transactions();
    drive_transactions();
    collect_output();
    check_results();

    #100;
    $finish;
  end

endprogram
