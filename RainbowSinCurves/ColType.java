import java.util.Random;

public enum ColType {
  RAINBOW, 
  SOFT, 
  WARM, 
  TOPC, 
  BOTTOMC;

  static int num = 5;

  static Random r = new Random();

  ColType() {
  }

  static ColType randomCol() {
    ColType choice = RAINBOW;
    int sel = r.nextInt(1000);
    if (sel % num == 0) {
      choice = RAINBOW;
    } 
    else if (sel % num == 1) {
      choice = SOFT;
    } 
    else if (sel % num == 2) {
      choice = WARM;
    } 
    else if (sel % num == 3) {
      choice = TOPC;
    } 
    else if (sel % num == 4) {
      choice = BOTTOMC;
    } 
    else {
      choice = SOFT;
    }
    return choice;
  }
}

