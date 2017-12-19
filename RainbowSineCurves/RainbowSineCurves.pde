// Rainbow Sine Curve Visualization
// Press the SPACE key to change the background from black to white

ArrayList<Curve> curves = new ArrayList<Curve>();

float xStart = 10;
float amp = 10;
float currentY = 0;
float yBuffer = 10;
float xBuffer = 5;
boolean blackBg;

void settings() {
  size(displayWidth, displayHeight - 45);
}

void setup() {
  colorMode(HSB, 360);
  Color_HSB.init(this);
  blackBg = true;
  int numPoints = (int)random(10, 100);  


  while (currentY < height) {
    amp = random(10, 50);
    Curve c = new Curve(xStart, currentY + amp + yBuffer, width - (xBuffer * 4), amp, (int)random(1, 5), numPoints);
    c.setCurveCol(Color_HSB.getRandomColType());
    curves.add(c);
    currentY = currentY + (amp * 2) + yBuffer;
  }
}

void draw() {
  noStroke();
  if (blackBg) {
    fill(10, 10);
  } else {
    fill(360, 10);
  }
  rect(-10, -10, width+10, height+10);

  for (Curve c : curves) {
    c.moveCurve();
    c.displayCurve();
  }
}

void keyPressed() {
  if (key == ' ') {
    blackBg = !blackBg;
  }
}