`ifndef LIB_CPU_SVH
`define LIB_CPU_SVH
package lib_cpu;

typedef struct packed
{
    logic [3:0] a, b, ip, out;
    logic cf;
} REGS;

typedef enum logic [3:0]
{
    MOV_A_B,            // mov a, b
    MOV_B_A,            // mov b, a
    MOV_A_IMM,          // mov a, imm
    MOV_B_IMM,          // mov b, imm
    OUT_B,              // out b
    OUT_IMM,            // out imm
    ADD_A_IMM,          // add a, imm
    ADD_B_IMM,          // add b, imm
    JMP_IMM,            // jmp imm
    JNC_IMM,            // jnc imm
    INVALID             // NOP
} OPECODE;

endpackage
`endif