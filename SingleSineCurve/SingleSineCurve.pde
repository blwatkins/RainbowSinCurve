// Single Sine Curve Visualization
// Press the UP key to increase the amplitude
// Press the DOWN key to decreate the amplitude
// Press the LEFT key to decrease the number of points
// Press the RIGHT key to increase the number of points
// Press the 'a' key to increase the frequency
// Press the 'd' key to decrease the frequency
// Press the 'q' key to change the background from black to white
// Press the 's' key to randomly change the color scheme

Curve c;
boolean blackBg;

void settings() {
  //size(displayWidth, displayHeight - 45);
  size(800, 800);
}

void setup() {
  colorMode(HSB, 360);
  blackBg = true;

  float xStart = 10;
  float currentY = 0;
  float yBuffer = 10;
  float xBuffer = 5;
  int numPoints = (int)random(10, 100);
  float amp = random(10, height / 2);
  int frequency = (int)random(1, 20);

  c = new Curve(xStart, height / 2, width - (xBuffer * 4), amp, frequency, numPoints);
  c.setColType(getRandomColType());
}

void draw() {
  noStroke();

  if (blackBg) {
    fill(10, 20);
  } else {
    fill(360, 20);
  }

  rect(-10, -10, width+10, height+10);

  c.display();
  c.move();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      c.increaseAmp();
    } else if (keyCode == DOWN) {
      c.decreaseAmp();
    } else if (keyCode == LEFT) {
      c.decreasePoints();
    } else if (keyCode == RIGHT) {
      c.increasePoints();
    }
  } else { 
    if (key == 'd') {
      c.increaseFrequency();
    } else if (key == 'a') {
      c.decreaseFrequency();
    } else if (key == 'q') {
      blackBg = !blackBg;
    } else if (key == 's') {
      c.setColType(getRandomColType());
    }
  }
}