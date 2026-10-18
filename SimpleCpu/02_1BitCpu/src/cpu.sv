module cpu
(
    input  logic clk,               // input: クロック
    input  logic n_reset,           // input: リセットボタン
    input  logic data,              // input: データ
    output logic address,           // output: アドレス
    output logic led                // output: LED 
);

    // モジュール内のワイヤー
    logic a, next_a;
    logic ip, next_ip;

    // DFF
    always_ff @(posedge clk) begin
        if (~n_reset) begin
            // リセット時
            a <= 1'b0;
            ip <= 1'b0;
        end else begin
            // 平常時
            a <= next_a;
            ip <= next_ip;
        end      
    end

    assign led = a; // aの状態を出力
    assign address = ip; // ipの状態を出力

    always_comb begin
        case (data)
            1'b0: next_a = a;   // 0: NOP
            1'b1: next_a = ~a;  // 1: NOT 
        endcase
        next_ip = ip + 1'b1; // next_ip++
    end
endmodule