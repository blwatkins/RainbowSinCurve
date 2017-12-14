class Curve {

  float baseX;
  float baseY;
  float pointX;
  float size;
  float curveAmp;
  int frequency;
  float pointTheta;
  Point[] points = new Point[30];

  Curve() {
  }

  Curve(float baseX, float baseY, float size, float curveAmp, int frequency) {
    this.baseX = baseX;
    this.baseY = baseY;
    this.size = size;
    this.frequency = frequency;
    this.curveAmp = curveAmp;
    pointX = baseX;
    pointTheta = 0;
    for (int i = 0; i < points.length; i++) {
      pointX = calculatePoint(i);
      points[i] = new Point(pointX, baseY, pointTheta, curveAmp);
      pointTheta += ( (TWO_PI * frequency) / points.length);
    }
  }

  float calculatePoint(int num) {
    float result = num * (size / points.length + 1) + baseX;
    return result;
  }

  void setCurveAmp(float newAmp) {
    for (int i = 0; i < points.length; i++) {
      points[i].setAmp(newAmp);
    }
    curveAmp = newAmp;
  }

  void moveCurve() {
    for (int i = 0; i < points.length; i++) {
      points[i].move();
    }
  }

  void displayCurve() {
    for (int i = 0; i < points.length; i++) {
      points[i].display();
    }
  }

  void setCurveCol(Color_HSB.ColType type) {
    for (int i = 0; i < points.length; i++) {
      points[i].setColor(Color_HSB.mapColor(type, points[i].theta % TWO_PI, 0, TWO_PI));
    }
  }
}