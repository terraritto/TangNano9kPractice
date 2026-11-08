`include "lib_cpu.svh"

module decoder import lib_cpu :: *;
(
    input logic [7:0] data,
    output OPECODE opecode,
    output logic[3:0] imm
);
    assign imm = data[3:0];

    always_comb begin
        unique case (data[7:4])
            4'b0000: opecode = ADD_A_IMM;       // 0: add A, imm
            4'b0101: opecode = ADD_B_IMM;       // 5: add B, imm
            4'b0011: opecode = MOV_A_IMM;       // 3: mov A, imm
            4'b0111: opecode = MOV_B_IMM;       // 7: mov B, imm
            4'b0001: opecode = MOV_A_B;         // 1: mov A, B
            4'b0100: opecode = MOV_B_A;         // 4: mov B, A
            4'b1111: opecode = JMP_IMM;         // 15: jmp imm
            4'b1110: opecode = JNC_IMM;         // 14: jnc imm
            4'b1001: opecode = OUT_B;           // 9: OUT B
            4'b1011: opecode = OUT_IMM;         // 11: OUT imm
            default: opecode = INVALID;         // NOP
        endcase
    end
endmodule