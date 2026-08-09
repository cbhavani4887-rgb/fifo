# FIFO Design Using Verilog

## 📌 Project Overview

This project implements a synchronous FIFO (First-In First-Out)
memory using Verilog HDL.

FIFO is a memory structure in which the first data written into
the memory is the first data read from the memory.

## 🎯 Objectives

- Design a synchronous FIFO using Verilog HDL
- Implement read and write operations
- Generate FULL and EMPTY status flags
- Verify FIFO functionality using a testbench
- Analyze the design using simulation waveforms

## 🧠 FIFO Operation

FIFO follows the principle:

First In → First Out

Example:

Data Written:

11 → 22 → 33 → 44

Data Read:

11 → 22 → 33 → 44

Therefore, the first data written is the first data read.

## ⚙️ Specifications

| Parameter | Value |
|-----------|-------|
| Data Width | 8 bits |
| FIFO Depth | 16 |
| Clock | Synchronous |
| Reset | Active High |
| Read Enable | rd_en |
| Write Enable | wr_en |

## 📂 Project Structure

FIFO-Verilog-Project/

├── README.md

├── rtl/

│   └── fifo.v

├── testbench/

│   └── fifo_tb.v

├── simulation/

│   └── waveform.vcd

└── docs/

    └── simulation_result.png

## 🔌 Inputs

- `clk` - Clock signal
- `rst` - Reset signal
- `wr_en` - Write enable
- `rd_en` - Read enable
- `din` - Input data

## 📤 Outputs

- `dout` - Output data
- `full` - FIFO full indicator
- `empty` - FIFO empty indicator

## 🧪 Verification

The testbench performs the following operations:

1. Reset the FIFO
2. Write `11`
3. Write `22`
4. Write `33`
5. Write `44`
6. Read the stored data
7. Verify FIFO ordering

Expected output:

WRITE: Data = 11
WRITE: Data = 22
WRITE: Data = 33
WRITE: Data = 44

READ: Data = 11
READ: Data = 22
READ: Data = 33
READ: Data = 44

## 📊 Simulation

The design can be simulated using:

- Icarus Verilog
- GTKWave
- ModelSim
- Vivado Simulator

### Using Icarus Verilog

Compile:

```bash
iverilog -o fifo_sim rtl/fifo.v testbench/fifo_tb.v