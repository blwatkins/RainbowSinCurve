// Rainbow Sine Curve Visualization
// Press the 'a' key to change the background to black or white

var curves = [];
var blackBg;

function setup() {
    createCanvas(windowWidth-20, windowHeight-20);
    colorMode(HSB, 360);
    blackBg = true;
    createCurves();
    createInstructions();
}

function draw() {
    drawBackground();
    curves.forEach(displayAndMoveCurve);
}

function keyTyped() {

    if (key == 'a') {
      blackBg = !blackBg;
    }

}

function createInstructions() {
    var instructionHeader = createElement("h1", "Instructions");
    var instructionList = createElement("ul", "");
    var instruction = createElement("li", "Press the 'a' key to change the background to black or white");
    instruction.parent(instructionList);
}

function createCurves() {
    var numPoints = parseInt(random(10, 100)); 
    var xStart = 10;
    var currentY = 0;
    var yBuffer = 10;
    var xBuffer = 5;
    var amp = 10;
    var frequency = 1;

    while (currentY < height) {
      amp = random(10, 50);
      frequency = parseInt(random(1, 5));
      var c = new Curve(xStart, currentY + amp + yBuffer, width - (xBuffer * 4), amp, frequency, numPoints);
      c.setColor(getRandomColorType());
      curves.push(c);
      currentY = currentY + (amp * 2) + yBuffer;
    }

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
