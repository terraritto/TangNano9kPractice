module mother_board
(
    input  logic clk,           // input: クロック
    input  logic n_reset,       // input: リセットボタン
    output logic [3:0] led      // output: LED
);
    // モジュール内のワイヤー
    logic [3:0] address;
    logic [7:0] data;

    // モジュールの埋め込み
    cpu cpu(.clk, .n_reset, .data, .address, .led);
    rom rom(.address, .data);

endmodule