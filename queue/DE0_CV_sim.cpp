#include <iostream>
#include <verilated.h>    // Defines common routines
#include "VDE0_CV.h"

unsigned int main_time = 0;     // Current simulation time

double sc_time_stamp () {       // Called by $time in Verilog
    return main_time;
}

int fall(){
  return 0;
}
int raise(){
  main_time++;
  return 1;
}

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);   // Remember args
    
    VDE0_CV *top = new VDE0_CV();
    
    top->p_reset = 0;        // Set some inputs
    top->m_clock = 0;

    while (!Verilated::gotFinish()) {
        if (main_time > 10) 
            top->p_reset = 1;    // リセットを解除する
        
        if ((main_time % 5) == 0)    // クロックを生成する
            top->m_clock = !top->m_clock;
            
        if (main_time > 20){    // roll を1にする
            top->in = main_time;
            top->push = 1;
        }
            
        top->eval();    // 評価
        

        if (main_time>200)
            break;         // 終了
        
        main_time++;
    }
    top->pop = 1;
    top->eval();
    cout << top->endo << endl;

    top->final();        // シミュレーション終了
}
