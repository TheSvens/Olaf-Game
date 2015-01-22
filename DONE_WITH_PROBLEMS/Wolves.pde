class Wolves {
  PImage wolf, wolfb;
  PVector loc, loc2, vel, vel2;
  float sz;
  float speed;


  Wolves(float tempspd, float tempsz) {
    wolf = loadImage("wolf dude.png");
    wolfb = loadImage("wolf dude back.png");
    sz = tempsz;
    speed = tempspd;
    loc = new PVector(random(-3000, -200), height-50);
    loc2 = new PVector(random(width+200, width+3000), height-50);
    vel = new PVector(random(3, 3.5), random(0, 0));
    vel2 = new PVector(random(-3, -3.5), random(0, 0));
  }

  void display() {
    imageMode(CENTER);
    image(wolf, loc.x, loc.y);
    image(wolfb, loc2.x, loc2.y);
  }
  void attack() {
    loc.add(vel);
    loc2.add(vel2);
  }
  void elliminate() {
    if (loc.dist(OlafLoc) <=140) {
      println("dead");
      vel = new PVector(0, 0);
      stage = 4;
    }
    if (loc2.dist(OlafLoc) <= 150) {
      vel2 = new PVector(0, 0);
      stage = 4;
    }
  }
}

