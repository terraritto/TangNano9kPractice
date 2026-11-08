`include "lib_cpu.svh"
`include "lib_operation.svh"

module alu import lib_cpu :: *, lib_operation :: *;
(
    input OPECODE opecode,
    input logic[3:0] imm,
    input REGS current,
    output REGS next
);
    always_comb begin
        unique case (opecode)
            MOV_A_B: next = mov_a_b(current);                   // mov A, B
            MOV_B_A: next = mov_b_a(current);                   // mov B, A
            MOV_A_IMM: next = mov_a_imm(current, imm);          // mov A, imm
            MOV_B_IMM: next = mov_b_imm(current, imm);          // mov B, imm
            OUT_B: next = out_b(current);                       // out B
            OUT_IMM: next = out_imm(current, imm);              // out imm
            ADD_A_IMM: next = add_a_imm(current, imm);          // add A, imm
            ADD_B_IMM: next = add_b_imm(current, imm);          // add B, imm
            JMP_IMM: next = jmp_imm(current, imm);              // jmp imm
            JNC_IMM: next = jnc_imm(current, imm);              // jnc imm
            default: next = nop(current);                       // NOP
        endcase
    end
endmodule