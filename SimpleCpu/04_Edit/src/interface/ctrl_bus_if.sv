// 制御用バスのインターフェース
interface ctrl_bus_if();
    logic clk;      // クロック
    logic n_reset;  // リセットボタン

    // 両方入力として定義
    modport master(input clk, input n_reset);
endinterface