const brain=require('brain.js')
var net = new brain.NeuralNetwork();
net.train([{input: [1,2], output: [0]},
           {input: [1,2], output: [0]},
           {input: [1,2], output: [1]},
           {input: [1,3], output: [1]},
           {input: [1,3], output: [1]},
           {input: [1,3], output: [0]},
           {input: [2,3], output: [0]},
           {input: [2,3], output: [0]},
           {input: [2,3], output: [1]}
        ]);        
var output = net.run([1,2]);
console.log('after match of A and B');
console.log('winning prob of B is'+output);
console.log('winning prob of A is'+(1-output));
var output = net.run([1,3]);
console.log('after match of A and C');
console.log('winning prob of C is'+output);
console.log('winning prob of A is'+(1-output));
var output = net.run([2,3]);
console.log('after match of C and B');
console.log('winning prob of C is'+output);
console.log('winning prob of B is'+(1-output));