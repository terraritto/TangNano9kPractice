module cpu
(
    input  logic clk,               // input: クロック
    input  logic n_reset,           // input: リセットボタン
    output logic led                // output: LED 
);

    logic a, next_a;  // モジュール内のワイヤー

    // DFF
    always_ff @(posedge clk) begin
        if (~n_reset) a <= 1'b0; // リセットされてたら1を注入
        else a <= next_a; // クロック立ち上がり時に反転したものを注入
    end

    assign led = a; // aの状態を出力

    always_comb begin
        next_a = ~a; // notゲートによる接続
    end
endmodule