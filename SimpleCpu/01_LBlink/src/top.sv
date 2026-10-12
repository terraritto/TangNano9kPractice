module top
(
    input  logic pin_clock,     // input: クロック
    input  logic pin_n_reset,   // input: リセットボタン
    output logic pin_led        // output: LED
);
    logic clk;
    prescaler #(.RATIO(27_000_000)) prescaler
    (
        .quick_clock(pin_clock),
        .slow_clock(clk)
    );

    cpu cpu(.clk, .n_reset(pin_n_reset), .led(pin_led));
endmodule