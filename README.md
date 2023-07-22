##-ZK-SNARK-Designer-Circuit

A hardhat-circom  to generate for this circuit!

![image](https://github.com/0Sujal/-ZK-SNARK-Designer-Circuit/assets/90201074/37d8bf38-c8c0-457b-9180-86ed493dbda6)

## Quick Start
Compile the Multiplier2() circuit and verify it against a smart contract verifier

```
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
```

# Install
npm i

## Compile
npx hardhat circom   This will generate the out file with circuit intermediaries and geneate the NewDesign.sol contract

## Prove and Deploy
npx hardhat run scripts/deploy.ts This script does 4 things

Deploys the NewDesign.sol contract
Generates a proof from circuit intermediaries with generateProof()
Generates calldata with generateCallData()
Calls verifyProof() on the verifier contract with calldata
# setup env file for privet key 
  run  npm i dotenv
  add this to your hardhat.config.jason 
  import 'dotenv/config';
  
   networks:{
  mumbai: {
    url: `https://rpc.ankr.com/polygon_mumbai`,
    accounts: [process.env.MUMBAIPRIVATEKEY]}},
    and create env file 
 Now  add mumbai test network to metamask account private key!  

 ![image](https://github.com/0Sujal/-ZK-SNARK-Designer-Circuit/assets/90201074/63a18f84-063d-4b05-8a6f-3a5684033ba7)
  
 to depoly run this command 
 npx hardhat run scripts/deploy.ts --network mumbai
 
 and you can check your transaction on https://mumbai.polygonscan.com/ 

 ![image](https://github.com/0Sujal/-ZK-SNARK-Designer-Circuit/assets/90201074/254ca899-fe7e-4046-8daa-924d7d028115)

  ![image](https://github.com/0Sujal/-ZK-SNARK-Designer-Circuit/assets/90201074/bc228319-a45d-48d8-a06c-7b9c73d24829)

 
#Authors- Sujal Dua 21BCS5327@cuchd.in

#License This project is licensed under the Sujal Dua License - see the LICENSE.md file for details
