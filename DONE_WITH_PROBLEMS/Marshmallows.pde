class Marshmallows {

  PImage marshmallow, marshmallowb;
  PVector loc, loc2, vel, vel2;
  float sz, speed;

  Marshmallows(float tempspd, float tempsz) {
    marshmallow = loadImage("golem guy back.png");
    marshmallowb = loadImage("golem guy.png");
    sz = tempsz;
    speed = tempspd;
    loc = new PVector(random(-3000, -200), height-105);
    loc2 = new PVector(random(width+200, width+3000), height-105);
    vel = new PVector(random(4, 5.5), random(0, 0));
    vel2 = new PVector(random(-4, -5.5), random(0, 0));
  }

  void display() {
    imageMode(CENTER);
    image(marshmallow, loc.x, loc.y);
    image(marshmallowb, loc2.x, loc2.y);
  }

  void attack() {
    if(level == 2){
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

