`include "lib_cpu.svh"

module cpu
(
    ctrl_bus_if.master ctrl_bus,    // 制御用バス
    io_bus_if.master io_bus,        // 入力用バス
    mem_bus_if.master mem_bus       // メモリ用バス
);
    import lib_cpu :: *;

    OPECODE opecode;
    logic [3:0] imm;
    decoder decoder(.data(mem_bus.data), .opecode, .imm);

    REGS current, next;
    assign mem_bus.address = current.ip;
    assign io_bus.led = current.out;

    alu alu(.opecode, .imm, .current, .next);
    write_reg write_reg(.ctrl_bus, .current, .next);
endmodule