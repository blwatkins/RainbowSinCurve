// Single Sine Curve Visualization
// Press the 'q' key to increase the amplitude
// Press the 'a' key to decreate the amplitude
// Press the 'w' key to increase the frequency
// Press the 's' key to decrease the frequency
// Press the 'e' key to increase the number of points
// Press the 'd' key to decrease the number of points

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
    } else if (key == 'w') {
        c.increaseFrequency();
    } else if (key == 's') {
        c.decreaseFrequency();
    } else if (key == 'd') {
        c.decreasePoints();
    } else if (key == 'e') {
        c.increasePoints();
    } else if (key == 'r') {
        blackBg = !blackBg;
    } else if (key == 'f') {
        c.setColor(getRandomColorType());
    }

}

function createInstructions() {
    var instructionHeader = createElement("h1", "Instructions");
    var instructionList = createElement("ul", "");
    var instructions = [];
    instructions.push(createElement("li", "Press the 'q' key to increase the amplitude"));
    instructions.push(createElement("li", "Press the 'a' key to decrease the amplitude"));
    instructions.push(createElement("li", "Press the 'w' key to increase the frequency"));
    instructions.push(createElement("li", "Press the 's' key to decrease the frequency"));
    instructions.push(createElement("li", "Press the 'e' key to increase the number of points"));
    instructions.push(createElement("li", "Press the 'd' key to decrease the number of points"));
    instructions.push(createElement("li", "Press the 'r' key to change the background to black or white"));
    instructions.push(createElement("li", "Press the 'f' key to randomly change the color scheme"));

    for (var i = 0; i < instructions.length; i++) {
        instructions[i].parent(instructionList);
    }

}

function createCurve() {
    var numPoints = parseInt(random(10, 100)); 
    var xStart = 10;
    var xBuffer = 10;
    var amp = random(10, height / 2);
    var frequency = parseInt(random(1, 20));

    c = new Curve(xStart, height / 2, width - (xBuffer * 2), amp, frequency, numPoints);
    c.setColor(getRandomColorType());
}

function drawBackground() {
    noStroke();

    if (blackBg) {
      fill(10, 20);
    } else {
      fill(360, 20);
    }

    rect(-10, -10, width+10, height+10);
}

function displayAndMoveCurve(curve) {
    curve.display();
    curve.move();
}
