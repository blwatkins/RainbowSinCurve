import processing.core.PApplet;

class Color_RGB {
  public static PApplet p;
  
  public static void init(PApplet context) {
    p = context;
  }

  public static String[] getColorNames() {
    String[] colorNames = {"magenta", "cyan", "blue", "red", "green"};
    return colorNames;
  }

  public static int getRandomColor(String name) {
    int c, r, g, b;

    switch (name) {
    case "magenta":
      r = (int)p.random(100, 255); g = (int)p.random(50, 100); b = (int)p.random(100, 255);
      break;

    case "cyan":
      r = (int)p.random(50, 100); g = (int)p.random(100, 255); b = (int)p.random(100, 255);
      break;

    case "blue":
      r = (int)p.random(50, 100); g = (int)p.random(50, 100); b = (int)p.random(100, 255);
      break;

    case "red":
      r = (int)p.random(100, 255); g = (int)p.random(50, 100); b = (int)p.random(50, 100);
      break;

    case "green":
      r = (int)p.random(50, 100); g = (int)p.random(100, 255); b = (int)p.random(50, 100);
      break;

    default:
      r = (int)p.random(50, 100); g = (int)p.random(50, 100); b = (int)p.random(50, 100);
      break;
    }

    c = p.color(r, g, b);
    return c;
  }
}