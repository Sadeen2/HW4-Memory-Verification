# HW4 - Memory Verification

This project implements a SystemVerilog verification environment for a synchronous 8-bit x64K RAM.

## Features
- Interface-based DUT connection
- Checker to prevent read and write in the same transaction
- Clocking block for testbench drive/observe
- Program block testbench
- Transaction class using OOP
- Tasks and queues for generate, drive, monitor, and check
- 10MHz clock

## Simulation Result
All transactions passed successfully with zero errors.
