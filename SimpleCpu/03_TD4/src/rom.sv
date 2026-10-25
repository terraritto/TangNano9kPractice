module rom
(
    input  logic [3:0] address,               // input: 命令のアドレス
    output logic [7:0] data                   // output: 出力
);

    always_comb begin
        case (address)                    // address  data  operate
            4'b0000: data = 8'b0111_1010; // 0        7A    mov B, 10
            4'b0001: data = 8'b1001_0000; // 1        90    OUT B
            4'b0010: data = 8'b0011_1101; // 2        3D    MOV A, 13
            4'b0011: data = 8'b0000_0001; // 3        01    ADD A, 1
            4'b0100: data = 8'b1110_0011; // 4        E3    JNC    3
            4'b0101: data = 8'b0101_0001; // 5        51    ADD B, 1
            4'b0110: data = 8'b1110_0001; // 6        E1    JNC    1
            4'b0111: data = 8'b1011_0000; // 7        B0    OUT    0
            4'b1000: data = 8'b1011_1111; // 8        BF    OUT    15
            4'b1001: data = 8'b1111_0111; // 9        F7    JMP    7
            default: data = 8'b0000_0000;
        endcase
    end
endmodule