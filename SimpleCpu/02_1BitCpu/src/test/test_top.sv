`timescale 1ns/1ps // 指定する時間をnsでシミュレータ制度はps

module test_top();
    logic pin_clock, pin_n_reset, pin_led;
    top top(.*);

    // クロック信号を生成
    // 5ns毎に電圧を反転
    always #5   pin_clock = ~pin_clock;
    initial     pin_clock = 1'b0;

    // prescalerの設定
    defparam top.prescaler.RATIO = 2;
    //initial top.prescaler.counter = 32'd0;
    //initial top.prescaler.slow_clock = 1'b0;

    initial begin
        pin_n_reset = 1'b0; // 時刻:0 でリセットを押した状態に
        #10;                // 10ns待ち
        pin_n_reset = 1'b1; // リセット解除、ここから動き出す
    end

    initial begin
        #200;                   // シミュレーションは200ns
        $finish();              // 終了
    end
endmodule