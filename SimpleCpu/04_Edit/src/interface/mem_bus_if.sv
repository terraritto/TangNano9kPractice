// メモリ用バスのインターフェース
interface mem_bus_if #(parameter ADDR_WIDTH, DATA_WIDTH) ();
    logic [ADDR_WIDTH-1:0] address;     // アドレス
    logic [DATA_WIDTH-1:0] data;        // データ

    modport master(output address, input data); // マスターポート
    modport slave(input address, output data);  // スレーブポート
endinterface