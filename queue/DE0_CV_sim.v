`timescale 1ps/1ps
`include "DE0_CV.v"

module DE0_CV_sim;
  reg p_reset, m_clock;
  reg[7:0] in;
  reg pop, push;
  wire[7:0] out;
  wire is_empty;

  DE0_CV DE0_CV(.in(in),
                .out(out),
                .is_empty(is_empty),
                .pop(pop),
                .push(push),
                .m_clock(m_clock),
                .p_reset(p_reset));

  initial begin
    $dumpfile("DE0_CV_sim.vcd");
    $dumpvars(0, DE0_CV);
    p_reset = 0;
    m_clock = 0;
    in = 0; pop = 0; push = 0;
    #10
    p_reset = 1;
    #10
    in = 7;
    push = 1;
    #10
    in = 2;
    #10
    in = 3;
    #10
    push = 0;
    #10
    pop = 1;
    #300
    $finish();
  end
  always #5 m_clock <= ~m_clock;
endmodule
