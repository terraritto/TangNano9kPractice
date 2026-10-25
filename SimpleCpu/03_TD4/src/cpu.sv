module cpu
(
    input  logic clk,               // input: クロック
    input  logic n_reset,           // input: リセットボタン
    input  logic [7:0] data,        // input: データ
    // input  logic [3:0] switch,      // input: スイッチ
    output logic [3:0] address,     // output: アドレス
    output logic [3:0] led          // output: LED 
);

    // モジュール内のワイヤー
    logic [3:0] a, next_a;          // 汎用レジスタ
    logic [3:0] b, next_b;          // 汎用レジスタ
    logic cf, next_cf;              // キャリーフラグ
    logic [3:0] ip, next_ip;        // 命令ポインタ
    logic [3:0] out, next_out;      // LED接続

    // DFF
    always_ff @(posedge clk) begin
        if (~n_reset) begin
            // リセット時
            a <= '0;
            b <= '0;
            cf <= '0;
            ip <= '0;
            out <= '0;
        end else begin
            // 平常時
            a <= next_a;
            b <= next_b;
            cf <= next_cf;
            ip <= next_ip;
            out <= next_out;
        end      
    end

    logic [3:0] opecode, imm; // 命令と即値
    assign opecode = data[7:4]; // データから命令を接続
    assign imm = data[3:0]; // データから即値を接続
    assign led = out; // outの状態を出力
    assign address = ip; // ipの状態を出力

    always_comb begin
        next_a = a;             // 汎用レジスタはそのままの値
        next_b = b;             // 汎用レジスタはそのままの値
        next_cf = 1'b0;         // キャリーフラグは0
        next_ip = ip + 4'd1;    // ipは1増やす
        next_out = out;         // LEDは現在の状態

        unique case (opecode)
            4'b0000: {next_cf, next_a} = a + imm;       // 0: add A, imm
            4'b0101: {next_cf, next_b} = b + imm;       // 5: add B, imm
            4'b0011: next_a = imm;                      // 3: mov A, imm
            4'b0111: next_b = imm;                      // 7: mov B, imm
            4'b0001: next_a = b;                        // 1: mov A, B
            4'b0100: next_b = a;                        // 4: mov B, A
            4'b1111: next_ip = imm;                     // 15: jmp imm
            4'b1110: next_ip = cf ? ip + 4'd1 : imm;    // 14: jnc imm
            // 4'b0010: next_a = switch;                   // 2: IN A
            // 4'b0110: next_b = switch;                   // 6: IN B
            4'b1001: next_out = b;                      // 9: OUT B
            4'b1011: next_out = imm;                    // 11: OUT imm
            default: ;
        endcase
    end
endmodule