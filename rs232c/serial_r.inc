declare serial_r {
    input       rxd;
    output      RCV[8];
    output      rcvcall;
    output      midi_data0[8];
    output      midi_data1[8];
    output      midi_data2[8];

    #define     BAUD_PERIOD     (434 - 1)
    #define     SAMP_TIMING     217
    #define     START_BIT       (BAUD_PERIOD - 25)
    #define     END_BIT         (BAUD_PERIOD - 25)
}
