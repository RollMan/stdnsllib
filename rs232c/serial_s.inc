#define DATBIT_DELAY 434
declare serial_s {
  input datain[8];
  output TDX;

  func_in launch(datain);
  func_out complete();
}
