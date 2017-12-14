
/*Produced by NSL Core(version=20170817), IP ARCH, Inc. Thu Dec 14 18:23:59 2017
 Licensed to :EVALUATION USER*/
/*
 DO NOT USE ANY PART OF THIS FILE FOR COMMERCIAL PRODUCTS. 
*/

module DE0_CV ( p_reset , m_clock , in , out , is_empty , pop , push );
  input p_reset, m_clock;
  wire p_reset, m_clock;
  input [7:0] in;
  wire [7:0] in;
  output [7:0] out;
  wire [7:0] out;
  output is_empty;
  wire is_empty;
  input pop;
  wire pop;
  input push;
  wire push;
  reg [7:0] m [0:31];
  reg [4:0] front_p;
  reg [4:0] end_p;
  reg [7:0] in_r;
  wire _net_0;
  wire _net_1;
  reg _reg_2;
  reg _reg_3;
  reg _reg_4;


// synthesis translate_off
// synopsys translate_off
always @(posedge m_clock or negedge p_reset)
  begin
if (((~_net_1)&_net_1))
 begin $display("Warning: assign collision(DE0_CV:_net_0) at %d",$time);
if ((~_net_1)) $display("assert ((~_net_1)) line 9 at %d\n",$time);
if (_net_1) $display("assert (_net_1) line 9 at %d\n",$time);
 end
 end

// synthesis translate_on
// synopsys translate_on
   assign  _net_0 = 
// synthesis translate_off
// synopsys translate_off
(((~_net_1)&_net_1))? 1'bx :(((~_net_1)|_net_1))? 
// synthesis translate_on
// synopsys translate_on
(((~_net_1))?1'b0:1'b0)|
    ((_net_1)?1'b1:1'b0)
// synthesis translate_off
// synopsys translate_off
:1'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  _net_1 = (front_p==end_p);
   assign  out = 
// synthesis translate_off
// synopsys translate_off
(pop)? 
// synthesis translate_on
// synopsys translate_on
((pop)?(m[front_p]):8'b0)
// synthesis translate_off
// synopsys translate_off
:8'bx
// synthesis translate_on
// synopsys translate_on
;
   assign  is_empty = _net_0;
always @(posedge m_clock)
  begin
   if (_reg_3 )
     m[end_p] <= in_r;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     front_p <= 5'b00000;
else if (pop)
      front_p <= (front_p+5'b00001);
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     end_p <= 5'b00000;
else if (_reg_3)
      end_p <= (end_p+5'b00001);
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     in_r <= 8'b00000000;
else if (((push|_reg_2)|_reg_4))
      in_r <= in;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     _reg_2 <= 1'b0;
else if (_reg_2)
      _reg_2 <= 1'b0;
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     _reg_3 <= 1'b0;
else if (((push|_reg_2)|(_reg_3|_reg_4)))
      _reg_3 <= (_reg_4|(push|_reg_2));
end
always @(posedge m_clock or negedge p_reset)
  begin
if (~p_reset)
     _reg_4 <= 1'b0;
else if (_reg_4)
      _reg_4 <= 1'b0;
end
endmodule

/*Produced by NSL Core(version=20170817), IP ARCH, Inc. Thu Dec 14 18:23:59 2017
 Licensed to :EVALUATION USER*/
