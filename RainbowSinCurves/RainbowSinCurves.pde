// Brittni Watkins
// Project Began: Unknown
// Last Updated: 15 June 2017
// IDE: Processing
// Rainbow Sin Curve Visualization

ArrayList<Curve> curves = new ArrayList<Curve>();

float xStart = 10.0;
float amp = 10;
float currentY = 0.0;
int yBuffer = 5;
int curveBuffer = 5;
float xBuffer = 5.0;

void setup() {
  colorMode(HSB, 360);
  size(800, 800);
  while (currentY < height) {
    amp = random(10, 50);
    curves.add(new Curve(xStart, currentY + amp + yBuffer, width - xBuffer, amp, (int)random(1, 5)));
    currentY = currentY + (amp * 2) + curveBuffer;
  }
  for (Curve c: curves) {
    c.setCurveCol(ColType.randomCol());
  }
}

void draw() {
  colorMode(RGB, 255);
  noStroke();
  fill(10, 10);
  rect(-10, -10, width+10, height+10);
  colorMode(HSB, 360);
  for (Curve c: curves) {
    c.moveCurve();
    c.displayCurve();
  }
}