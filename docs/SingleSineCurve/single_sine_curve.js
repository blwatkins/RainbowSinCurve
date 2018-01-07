// Single Sine Curve Visualization
// Press the UP key to increase the amplitude
// Press the DOWN key to decreate the amplitude
// Press the LEFT key to decrease the number of points
// Press the RIGHT key to increase the number of points
// Press the 'a' key to increase the frequency
// Press the 'd' key to decrease the frequency
// Press the 'q' key to change the background from black to white
// Press the 's' key to randomly change the color scheme

var c;
var blackBg;

function setup() {
    createCanvas(windowWidth-20, windowHeight-20);
    colorMode(HSB, 360);
    blackBg = true;
    createCurve();
    console.log(c);
}

function draw() {
    drawBackground();
    displayAndMoveCurve(c);
}

function keyTyped() {

    if (key == 'a') {
      blackBg = !blackBg;
    }

}

function keyPressed() {

    if (keyCode == UP_ARROW) {
        c.increaseAmp();
        console.log(c);
    }

}

// function createInstructions() {
//     var instructionHeader = createElement("h1", "Instructions");
//     var instructionList = createElement("ul", "");
//     var instruction = createElement("li", "Press the 'a' key to change the background to black or white");
//     instruction.parent(instructionList);
// }

function createCurve() {
    var numPoints = parseInt(random(10, 100)); 
    var xStart = 10;
    var xBuffer = 10;
    var amp = 10; //random(10, height / 2);;
    var frequency = 1; //parseInt(random(1, 20));;

    c = new Curve(xStart, height / 2, width - (xBuffer * 2), amp, frequency, numPoints);
    c.setColor(getRandomColorType());
}

function drawBackground() {
    noStroke();

    if (blackBg) {
      fill(10, 10);
    } else {
      fill(360, 10);
    }

    rect(-10, -10, width+10, height+10);
}

function displayAndMoveCurve(curve) {
    curve.display();
    curve.move();
}
