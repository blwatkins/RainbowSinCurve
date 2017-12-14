// Brittni Watkins
// Project Began: Unknown
// Last Updated: 15 June 2017
// IDE: Processing
// Rainbow Sin Curve Visualization

ArrayList<Curve> curves = new ArrayList<Curve>();

float xStart = 10;
float amp = 10;
float currentY = 0;
float yBuffer = 10;
float xBuffer = 5;

void setup() {
  size(1500, 600);
  colorMode(HSB, 360);
  Color_HSB.init(this);
  while (currentY < height) {
    amp = random(10, 50);
    Curve c = new Curve(xStart, currentY + amp + yBuffer, width - xBuffer, amp, (int)random(1, 5));
    c.setCurveCol(Color_HSB.getRandomColType());
    curves.add(c);
    currentY = currentY + (amp * 2) + yBuffer;
  }

}

void draw() {
  colorMode(RGB, 255);
  noStroke();
  fill(10, 10);
  rect(-10, -10, width+10, height+10);
  colorMode(HSB, 360);
  for (Curve c : curves) {
    c.moveCurve();
    c.displayCurve();
  }
}