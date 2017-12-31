// Rainbow Sine Curve Visualization
// HSB Color Functions
// Functions for working with HSB colors
// 0-360 scale

enum ColType {
  RAINBOW, 
    SOFT, 
    WARM, 
    TOPC, 
    BOTTOMC;
};

ColType getRandomColType() {
  int rand = (int)random(1000);
  ColType choice = ColType.RAINBOW;

  switch(rand % 5) {

  case 0:
    choice = ColType.RAINBOW;
    break;

  case 1:
    choice = ColType.SOFT;
    break;

  case 2:
    choice = ColType.WARM;
    break;

  case 3:
    choice = ColType.TOPC;
    break;

  case 4:
    choice = ColType.BOTTOMC;
    break;

  default:
    choice = ColType.RAINBOW;
    break;
  }

  return choice;
}

color mapColor(ColType type, float num, float min, float max) {
  int hue = 0;

  switch (type) {

  case RAINBOW:
    hue = (int)map(num, min, max, 0, 360);
    break;

  case SOFT:
    hue = (int)map(num, min, max, 90, 285);
    break;

  case WARM:
    hue = (int)map(num, min, max, 0, 70);
    break;

  case TOPC:
    hue = (int)map(num, min, max, 180, 360);
    break;

  case BOTTOMC:
    hue = (int)map(num, min, max, 0, 180);
    break;

  default:
    break;
  }

  return color(hue, 360, 360);
}