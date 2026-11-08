module mother_board
(
    ctrl_bus_if.master ctrl_bus,    // 制御用バス
    io_bus_if.master io_bus         // 入力用バス
);

    // メモリ用バス
    mem_bus_if #(.ADDR_WIDTH(4), .DATA_WIDTH(8)) mem_bus();

    // モジュールの埋め込み
    cpu cpu(.ctrl_bus, .io_bus, .mem_bus);
    rom rom(.mem_bus);

endmodule