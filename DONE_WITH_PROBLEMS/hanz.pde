class Hanz {

  PImage hanz, hanzb;
  PVector loc, loc2, vel, vel2;
  float sz, speed;

  Hanz(float tempspd, float tempsz) {
    hanz = loadImage("HAN.png");
    hanzb = loadImage("hann.png");
    sz = tempsz;
    speed = tempspd;
    loc = new PVector(random(-2500, -100), height-155);
    loc2 = new PVector(random(width+100, width+2500), height-155);
    vel = new PVector(6.2, 0);
    vel2 = new PVector(-6.2, 0);
  }

  void display() {
    imageMode(CENTER);
    image(hanz, loc.x, loc.y);
    image(hanzb, loc2.x, loc2.y);
  }

  void attack() {
    if (level == 3) {
      loc.add(vel);
      loc2.add(vel2);
    }
  }
 void elliminate() {
    if (loc.dist(OlafLoc) <=140) {
      println("dead");
      vel = new PVector(0, 0);
      stage = 5;
    }
    if (loc2.dist(OlafLoc) <= 150) {
      vel2 = new PVector(0, 0);
      stage = 5;
    }
  }
}

