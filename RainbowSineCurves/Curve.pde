// Rainbow Sine Curve Visualization
// Curve class

class Curve {

  float baseX;
  float baseY;
  float len;
  float curveAmp;
  int frequency;
  int numPoints;
  ArrayList<Point> points;

  Curve(float baseX, float baseY, float len, float curveAmp, int frequency) {
    this.baseX = baseX;
    this.baseY = baseY;
    this.len = len;
    this.frequency = frequency;
    this.curveAmp = curveAmp;
    this.numPoints = 30;
    points = new ArrayList<Point>();
    createPoints();
  }

  Curve(float baseX, float baseY, float len, float curveAmp, int frequency, int numPoints) {
    this.baseX = baseX;
    this.baseY = baseY;
    this.len = len;
    this.frequency = frequency;
    this.curveAmp = curveAmp;
    this.numPoints = numPoints;
    points = new ArrayList<Point>();
    createPoints();
  }

  void createPoints() {
    float pointX = baseX;
    float pointTheta = 0;

    for (int i = 0; i < numPoints; i++) {
      pointX = calculatePoint(i);
      points.add(new Point(pointX, baseY, pointTheta, curveAmp));
      pointTheta += ( (TWO_PI * frequency) / numPoints);
    }
  }

  float calculatePoint(int num) {
    float result = num * (len / (numPoints - 1)) + baseX;
    return result;
  }

  void setCurveAmp(float newAmp) {

    for (Point p : points) {
      p.setAmp(newAmp);
    }

    curveAmp = newAmp;
  }

  void moveCurve() {
    for (Point p : points) {
      p.move();
    }
  }

  void displayCurve() {
    for (Point p : points) {
      p.display();
    }
  }

  void setCurveCol(ColType type) {
    for (Point p : points) {
      p.setColor(mapColor(type, p.theta % TWO_PI, 0, TWO_PI));
    }
  }
}