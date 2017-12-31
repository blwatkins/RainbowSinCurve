// Rainbow Sine Curve Visualization
// Press the 'a' key to change the background from black to white

//ArrayList<Curve> curves = new ArrayList<Curve>();

var xStart = 10;
var amp = 10;
var currentY = 0;
var yBuffer = 10;
var xBuffer = 5;
var blackBg;

var p;

function setup() {
    createCanvas(windowWidth-20, windowHeight-20);
    colorMode(HSB, 360);
    blackBg = true;
    var numPoints = parseInt(random(10, 100)); 


    p = new Point(100, 200, 0.6, 50);
    print(p);

    // while (currentY < height) {
    //   amp = random(10, 50);
    //   Curve c = new Curve(xStart, currentY + amp + yBuffer, width - (xBuffer * 4), amp, (int)random(1, 5), numPoints);
    //   c.setCurveCol(getRandomColType());
    //   curves.add(c);
    //   currentY = currentY + (amp * 2) + yBuffer;
    // }
}

function draw() {
    noStroke();

    if (blackBg) {
      fill(10, 10);
    } else {
      fill(360, 10);
    }

    rect(-10, -10, width+10, height+10);

    p.display();
    p.move();

    // for (Curve c : curves) {
    //   c.moveCurve();
    //   c.displayCurve();
    // }
}

function keyTyped() {
    if (key == 'a') {
      blackBg = !blackBg;
    }
}