module top
(
    input  logic pin_clock,         // input: クロック
    input  logic pin_n_reset,       // input: リセットボタン
    output logic [3:0] pin_led      // output: LED
);
    logic clk;
    prescaler #(.RATIO(27_000_000)) prescaler
    (
        .quick_clock(pin_clock),
        .slow_clock(clk)
    );

    // 制御用バス
    ctrl_bus_if ctrl_bus();
    assign ctrl_bus.clk = clk;
    assign ctrl_bus.n_reset = pin_n_reset;

    // 入力用バス
    io_bus_if #(.WIDTH(4)) io_bus();
    assign pin_led = io_bus.led;

    mother_board mother_board(.ctrl_bus, .io_bus);
endmodule