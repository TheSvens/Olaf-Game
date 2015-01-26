class Wolves {
  PImage wolf, wolfb;                                                                     //wolf PImage
  PVector loc, loc2, vel, vel2;                                                           //PVectors for locations and velocities
  float sz, speed;                                                                        //float size and speed
                                                                          

  Wolves(float tempspd, float tempsz) {
    wolf = loadImage("wolf dude.png");                                                    //load images
    wolfb = loadImage("wolf dude back.png");
    sz = tempsz;
    speed = tempspd;
    loc = new PVector(random(-3000, -200), height-50);                                    //new pvectors
    loc2 = new PVector(random(width+200, width+3000), height-50);
    vel = new PVector(random(3, 3.5), random(0, 0));
    vel2 = new PVector(random(-3, -3.5), random(0, 0));
  }

  void display() {
    imageMode(CENTER);
    image(wolf, loc.x, loc.y);                                                          // wolf images locations
    image(wolfb, loc2.x, loc2.y);
  }
  void attack() {
    loc.add(vel);                                                                      //add velocity to move wolves
    loc2.add(vel2);
  }
  void elliminate() {
    if (loc.dist(OlafLoc) <=140) {                                                    //if the wolf location is same as olaf's
      println("dead");
      vel = new PVector(0, 0);                                                        //stop moving
      stage = 5;                                                                      //change to stage 5 (lose)
    }
    if (loc2.dist(OlafLoc) <= 150) {                                                  //if the wolf location is same as olaf's
      vel2 = new PVector(0, 0);                                                       //stop moving
      stage = 5;                                                                      //change to stage 5 (lose)    
    }
  }
}

