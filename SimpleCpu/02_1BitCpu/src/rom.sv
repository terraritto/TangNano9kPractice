module rom
(
    input  logic address,               // input: 命令のアドレス
    output logic data                   // output: 出力
);

    always_comb begin
        case (address)
            1'b0: data = 1'b1; // 0: NOT命令
            1'b1: data = 1'b0; // 1: NOP命令
        endcase
    end
endmodule