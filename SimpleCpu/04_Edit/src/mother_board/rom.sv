module rom
(
    mem_bus_if.slave mem_bus    // メモリ用バス
);

    logic [7:0] rom_array [16]; // 8bitワイヤーx16本
    initial $readmemh("rom_data.mem", rom_array); // romの読み込み
    assign mem_bus.data = rom_array[mem_bus.address]; // 繋ぐ
endmodule