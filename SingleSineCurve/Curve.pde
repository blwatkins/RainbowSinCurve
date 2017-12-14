// Single Sine Curve Visualization
// Curve class

class Curve {

  float baseX;
  float baseY;
  float len;
  float curveAmp;
  float deltaTheta;
  int originalFrequency;
  int frequency;
  int numPoints;
  int originalNumPoints;
  float colorDeltaTheta;
  ArrayList<Point> points;
  Color_HSB.ColType colType;

  Curve(float baseX, float baseY, float len, float curveAmp, int frequency) {
    this.baseX = baseX;
    this.baseY = baseY;
    this.len = len;
    this.frequency = frequency;
    originalFrequency = frequency;
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
    originalFrequency = frequency;
    this.curveAmp = curveAmp;
    this.numPoints = numPoints;
    points = new ArrayList<Point>();
    createPoints();
  }

  void setColType(Color_HSB.ColType type) {
    this.colType = type;
    setPointColors();
  }

  void createPoints() {
    float pointX = baseX;
    float pointTheta = 0;

    if (numPoints < 2) {
      numPoints = 2;
    }

    originalNumPoints = numPoints;

    deltaTheta = (TWO_PI * frequency) / numPoints;
    colorDeltaTheta = deltaTheta;

    for (int i = 0; i < numPoints; i++) {
      pointX = calculatePoint(i);
      points.add(new Point(pointX, baseY, pointTheta, curveAmp));
      pointTheta += deltaTheta;
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

  void increaseAmp() {

    if (curveAmp < height) {
      setCurveAmp(curveAmp + 1);
    }
  }

  void decreaseAmp() {

    if (curveAmp > 10) {
      setCurveAmp(curveAmp - 1);
    }
  }

  void move() {

    for (Point p : points) {
      p.move();
    }
  }

  void display() {

    for (Point p : points) {
      p.display();
    }
  }

  void setPointColors() {

    for (Point p : points) {
      p.setColor(Color_HSB.mapColor(colType, p.theta % TWO_PI, 0, TWO_PI));
    }
  }

  void decreasePoints() {

    if (points.size() > 2) {
      points.remove(points.size() - 1);
      numPoints--;

      for (int i = 0; i < numPoints; i++) {
        float pointX = calculatePoint(i);
        points.get(i).x = pointX;
      }
    }
  }

  void increasePoints() {
    float colorTheta = 0;
    numPoints++;

    for (int i = 0; i < numPoints; i++) {
      float pointX = calculatePoint(i);

      if (i == numPoints - 1) {
        float pointTheta = points.get(i-1).theta + deltaTheta;
        Point p = new Point(pointX, baseY, pointTheta, curveAmp);
        p.setColor(Color_HSB.mapColor(colType, colorTheta % TWO_PI, 0, TWO_PI));
        points.add(p);
        checkFrequency();
      } else {
        points.get(i).x = pointX;
      }

      colorTheta += colorDeltaTheta;
    }
  }

  void checkFrequency() {
    if (numPoints / originalNumPoints > frequency) {
      frequency++;
      println("freqency = " + frequency);
    }
  }

  void increaseFrequency() {
    frequency += 1;
    deltaTheta = (TWO_PI * frequency) / numPoints;
    float pointTheta = 0;

    colorDeltaTheta = (TWO_PI * frequency / (abs(originalFrequency - frequency) + 1)) / numPoints;

    for (Point p : points) {
      p.theta = pointTheta;
      pointTheta += deltaTheta;
    }
  }
}