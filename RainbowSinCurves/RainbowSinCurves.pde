//Brittni Watkins
//Testing stuff for fun

ArrayList<Curve> curves = new ArrayList<Curve>();

float xStart = 10.0;
float amp = 10;
float currentY = 0.0;
int yBuffer = 5;
int curveBuffer = 5;
float xBuffer = 5.0;

void setup() {
  colorMode(HSB, 360);
  size(700, 700);
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
  stroke(0);
  fill(10, 10);
  rect(0, 0, width, height);
  colorMode(HSB, 360);
  for (Curve c: curves) {
    c.moveCurve();
    c.displayCurve();
  }
}


