// Single Sine Curve Visualization
// Press any key to change the background from black to white

Curve c;
boolean blackBg;

void settings() {
  //size(displayWidth, displayHeight - 45);
  size(600, 600);
}

void setup() {
  colorMode(HSB, 360);
  Color_HSB.init(this);
  blackBg = true;

  float xStart = 10;
  float currentY = 0;
  float yBuffer = 10;
  float xBuffer = 5;
  int numPoints = (int)random(10, 100);
  float amp = random(10, height / 2);
  int frequency = (int)random(1, 20);

  c = new Curve(xStart, height / 2, width - (xBuffer * 4), 50, 1, 35);
  c.setColType(Color_HSB.getRandomColType());
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
   if (key == 'a') {
    c.increaseFrequency(); 
   }
    
  }
}