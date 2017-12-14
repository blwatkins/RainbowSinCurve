// Single Sine Curve Visualization
// Point class

class Point {

  float baseX;
  float baseY;
  float x;
  float y;
  float theta;
  float amp;
  color col;

  Point() {
    theta = 0;
    amp = 5;
    baseX = 0;
    baseY = 0;
    x = baseX;
    y = calculateSin();
    col = color(255, 0, 0);
  }

  Point(float baseX, float baseY, float theta, color col) {
    this.theta = theta;
    amp = 50;
    this.baseX = baseX;
    this.baseY = baseY;
    x = baseX;
    y = calculateSin();
    this.col = col;
  }

  Point(float baseX, float baseY, float theta) {
    this.theta = theta;
    amp = 50;
    this.baseX = baseX;
    this.baseY = baseY;
    x = baseX;
    y = calculateSin();
    col = color(255);
  }

  Point(float baseX, float baseY, float theta, float amp) {
    this.theta = theta;
    this.amp = amp;
    this.baseX = baseX;
    this.baseY = baseY;
    x = baseX;
    y = calculateSin();
    col = color(255);
  }

  void display() {
    stroke(col);
    strokeWeight(5);
    point(x, y);
  }

  void move() {
    theta += 0.1;
    if (theta > TWO_PI) {
     theta = theta % TWO_PI; 
    }
    y = calculateSin();
  }

  float calculateSin() {
    return baseY + (sin(theta) * amp);
  }

  void setAmp(float newAmp) {
    amp = newAmp;
  }

  void setColor(color newCol) {
    col = newCol;
  }
}