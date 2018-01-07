// Single Sine Curve Visualization
// Press the 'q' key to increase the amplitude
// Press the 'a' key to decreate the amplitude

var c;
var blackBg;

function setup() {
    createCanvas(windowWidth-20, windowHeight-20);
    colorMode(HSB, 360);
    blackBg = true;
    createCurve();
    createInstructions();
}

function draw() {
    drawBackground();
    displayAndMoveCurve(c);
}

function keyTyped() {

    if (key == 'q') {
        c.increaseAmp();
    } else if (key == 'a') {
      c.decreaseAmp();
    }

}

function createInstructions() {
    var instructionHeader = createElement("h1", "Instructions");
    var instructionList = createElement("ul", "");
    var instructions = [];
    instructions.push(createElement("li", "Press the 'q' key to increase the amplitude"));
    instructions.push(createElement("li", "Press the 'a' key to decrease the amplitude"));

    for (var i = 0; i < instructions.length; i++) {
        instructions[i].parent(instructionList);
    }

}

function createCurve() {
    var numPoints = 10;//parseInt(random(10, 100)); 
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
