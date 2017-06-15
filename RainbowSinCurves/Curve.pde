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
    float result = num * (size / points.length) + baseX;
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

  color rainbowColors(float comp) {
    float col;
    colorMode(HSB, 360);
    col = map(comp % TWO_PI, 0, TWO_PI, 0, 360);
    return color(col, 360, 360);
  }

  color softColors(float comp) {
    float col;
    colorMode(HSB, 360);
    col = map(comp % TWO_PI, 0, TWO_PI, 90, 285);
    return color(col, 360, 360);
  }

  color warmColors(float comp) {
    float col;
    colorMode(HSB, 360);
    col = map(comp % TWO_PI, 0, TWO_PI, 0, 70);
    return color(col, 360, 360);
  }

  color bottomColors(float comp) {
    float col;
    colorMode(HSB, 360);
    col = map(comp % TWO_PI, 0, TWO_PI, 0, 180);
    return color(col, 360, 360);
  }

  color topColors(float comp) {
    float col;
    colorMode(HSB, 360);
    col = map(comp % TWO_PI, 0, TWO_PI, 180, 360);
    return color(col, 360, 360);
  }

  void setCurveCol(ColType type) {
    switch (type) {
    case RAINBOW:
      for (int i = 0; i < points.length; i++) {
        points[i].setColor(rainbowColors(points[i].theta));
      }
      break;
    case SOFT:
      for (int i = 0; i < points.length; i++) {
        points[i].setColor(softColors(points[i].theta));
      }
      break;
    case WARM:
      for (int i = 0; i < points.length; i++) {
        points[i].setColor(warmColors(points[i].theta));
      }
      break;
    case TOPC:
      for (int i = 0; i < points.length; i++) {
        points[i].setColor(topColors(points[i].theta));
      }
      break;
    case BOTTOMC:
      for (int i = 0; i < points.length; i++) {
        points[i].setColor(bottomColors(points[i].theta));
      }
      break;
    default:
      break;
    }
  }
}

