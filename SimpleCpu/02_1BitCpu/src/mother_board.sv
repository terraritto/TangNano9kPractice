module mother_board
(
    input  logic clk,       // input: クロック
    input  logic n_reset,   // input: リセットボタン
    output logic led        // output: LED
);
    // モジュール内のワイヤー
    logic address;
    logic data;

    // モジュールの埋め込み
    cpu cpu(.clk, .n_reset, .address, .data, .led);
    rom rom(.address, .data);

endmodule