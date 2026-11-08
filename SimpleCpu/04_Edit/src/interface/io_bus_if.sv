// 入力用バスのインターフェース
// 入力としてビット数をWIDTHとして設定できるように
interface io_bus_if #(parameter WIDTH) ();
    logic [WIDTH-1:0] led;      // LED

    // LEDは出力
    modport master(output led);
endinterface