// Rainbow Sine Curve Visualization
// HSB Color Class
// Functions for working with HSB colors
// 0-360 scale

import processing.core.PApplet;

public class Color_HSB {
  private static PApplet p;

  public enum ColType {
    RAINBOW, 
      SOFT, 
      WARM, 
      TOPC, 
      BOTTOMC;
  }

  public static void init(PApplet context) {
    p = context;
  }

  public static ColType getRandomColType() {
    int rand = (int)p.random(1000);
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

  public static int mapColor(ColType type, float num, float min, float max) {
    int hue = 0;

    switch (type) {

    case RAINBOW:
      hue = (int)p.map(num, min, max, 0, 360);
      break;

    case SOFT:
      hue = (int)p.map(num, min, max, 90, 285);
      break;

    case WARM:
      hue = (int)p.map(num, min, max, 0, 70);
      break;

    case TOPC:
      hue = (int)p.map(num, min, max, 180, 360);
      break;

    case BOTTOMC:
      hue = (int)p.map(num, min, max, 0, 180);
      break;

    default:
      break;
    }

    return p.color(hue, 360, 360);
  }
}