pragma circom 2.0.0;

template NewDesign() {
    signal input a;
    signal input b;
    signal output c;

    // Create intermediate signals for AND, NOT gate outputs.
    signal inter_AND;
    signal inter_NOT;


    // Define AND gate component.
    component ANDGate = AND();
    ANDGate.a <== a;
    ANDGate.b <== b;
    inter_AND <== ANDGate.out;

    // Define NOT gate component.
    component NOTGate = NOT();
    NOTGate.in <== b;
    inter_NOT <== NOTGate.out;

    // Define OR gate component.
    component ORGate = OR();
    ORGate.a <== inter_AND;
    ORGate.b <== inter_NOT;
    c <== ORGate.out;

    
}
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = NewDesign();