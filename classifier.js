//Author: Cody Harrison
//Title: Doodle Classifier
//Date: 11/30/2018
//This program creates neural network and trains it so that it can accept
//a user drawn image and classify it as 1 of 5 animals
//Uses the Toy Neural Network Libaray provided by Coding Train and Google's
//creative team's Quick, Draw! database
//Help from The Coding Train:
//Youtube:https://www.youtube.com/channel/UCvjgXvBlbQiydffZU7m1_aw
const total_drawings = 20000;
const RESULTS = 5;
//position in output vector
const BIRD = 0;
const HORSE = 1;
const SHARK = 2;
const CRAB = 3;
const SHEEP = 4;

let birds_data;
let horses_data;
let sharks_data;
let crabs_data;
let sheep_data;


function preload(){
  birds_data = loadBytes('/data/bird.bin');
  horses_data = loadBytes('/data/horse.bin');
  sharks_data = loadBytes('/data/shark.bin');
  crabs_data = loadBytes('/data/crab.bin');
  sheep_data = loadBytes('/data/sheep.bin');


}

let birds = {};
let horses = {};
let sharks = {};
let crabs = {};
let sheep = {};

let neural;

//Prepares data by loading byte array into subarrays
function prepData(category, data, label){
  //array to hold byte info of trainers
  category.trainers = [];
  //array to hold bbyte info of testers
  category.testing = [];

    for ( let i = 0; i < total_drawings; i++){
      //offset by 784 * which image we are on
      let offset = i * 784;
      //for the first 800
      if (i < 19800){
        //create subarray of bytes array for each image for training
        category.trainers[i] = data.bytes.subarray(offset, offset + 784);
        category.trainers[i].label = label;
      } else {
        //create subarray of bytes array for each image for testing
        category.testing[i - 19800] = data.bytes.subarray(offset, offset + 784);
        category.testing[i - 19800].label = label;
      }
    }
  }

function setup() {
createCanvas(280,280);
const context = canvas.getContext('2d');
background(0);
//preparing data
prepData(birds, birds_data, BIRD);
prepData(horses, horses_data, HORSE);
prepData(sharks, sharks_data, SHARK);
prepData(crabs, crabs_data, CRAB);
prepData(sheep, sheep_data, SHEEP);
//NeuralNetwork(784 inputs, 128 hidden nodes, how many possible reults)
neural = new NeuralNetwork(784,128,RESULTS);


//create one large training array for all arrays used to train neural network
let training = [];
training = training.concat(birds.trainers);
training = training.concat(sharks.trainers);
training = training.concat(horses.trainers);
training = training.concat(crabs.trainers);
training = training.concat(sheep.trainers);
//create one large testing array for all arrays used to test neural network
let testing = [];
testing = testing.concat(birds.testing);
testing = testing.concat(horses.testing);
testing = testing.concat(sharks.testing);
testing = testing.concat(crabs.testing);
testing = testing.concat(sheep.testing);
console.log(testing);

//shuffle array to train neural network evenly amongst animals
shuffle(training, true)

//train for one epoch
for(let i = 0; i < 1; i++){
  //train
  for (let i = 0; i < training.length; i++ ){
    //create inputs array
    let inputs = [];
    //let data equal array in training at i
    let data =  training[i]
    //for each element in dat
    for (let n = 0; n < data.length; n++)
    {
      //normalize the data by dividing by 255 since it an integer between 0 and 255
      inputs[n] = data[n]/ 255.0;
    }
    let label = training[i].label;
    //output vector
    let targets = [0,0,0,0,0]
    //set vector at label = to 1
    targets[label] = 1;
    console.log();

    // train neural network using inputs, labels, and targets
    // adjusts weights of inputs using the calculated error
    // from nn.js library
    neural.train(inputs, targets);
    console.log("trained")
  }
}

let correct = 0;
// test data in testing array
for (let i = 0; i < testing.length; i++ ){
  //create inputs array
  let inputs = [];
  //let data equal array in training at i
  let data =  testing[i]
  //for each element in dat
  for (let n = 0; n < data.length; n++)
  {
    //normalize the data by dividing by 255 since it an integer between 0 and 255
    inputs[n] = data[n]/ 255.0;
  }
  let label = testing[i].label;
  let guess = neural.predict(inputs);
  //max value of guess vector
  let m = max(guess);
  //index of max value of guess vector
  let classification = guess.indexOf(m);


  if(classification === label){
    correct++;
  }

}

let percent = 100 * correct/testing.length;
console.log("Percent: " + nf(percent,2,2) + "%");

let clearButton = select('#clear');
clearButton.mousePressed(function(){
  context.clearRect(0,0, canvas.width, canvas.height);
  background(0)
});


let guessButton = select('#guess');
//when guess button is pressed
guessButton.mousePressed(function(){
//create input array
let inputs = [];
//return image from canvas
let img = get();
//resize image to match dataset
img.resize(28,28);
//get pixel info
img.loadPixels();
//for every fouth element in pixels array
for (let i = 0; i < img.pixels.length; i +=4){
  //set bright to element in pixel array
  let bright = img.pixels[i];
  //normalize the data
  inputs[i/4] =  bright/255.0;
}
console.log(inputs);
//returns float of what neural thinks image is
let guess = neural.predict(inputs);
//gets max value from guess vector
let m = max(guess)
//gets position of max value in guess vector
let classification = guess.indexOf(m);
if (classification === BIRD){
  console.log("bird");
} else if (classification === HORSE){
  console.log("horse");
} else if (classification === SHARK){
  console.log("shark");
} else if (classification === CRAB){
  console.log("crab");
} else if (classification === SHEEP){
  console.log("sheep");
}



});

}
//draw function
function draw(){
  //line thickness
  strokeWeight(12);
  //color
  stroke(255);
  if(mouseIsPressed){
  line(pmouseX,pmouseY,mouseX,mouseY)
  }
}
