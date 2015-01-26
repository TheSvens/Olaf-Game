class Hanz {

  PImage hanz, hanzb;                                                          //hanz PImages
  PVector loc, loc2, vel, vel2;                                                //PVectors for locations and velocities
  float sz, speed;                                                             //floats for size and speed

  Hanz(float tempspd, float tempsz) {
    hanz = loadImage("HAN.png");                                              //load images
    hanzb = loadImage("hann.png");
    sz = tempsz;
    speed = tempspd;
    loc = new PVector(random(-2500, -100), height-155);                      //new PVectors
    loc2 = new PVector(random(width+100, width+2500), height-155);
    vel = new PVector(6.2, 0);
    vel2 = new PVector(-6.2, 0);
  }

  void display() {      
    imageMode(CENTER);
    image(hanz, loc.x, loc.y);                                              //hanz images locations
    image(hanzb, loc2.x, loc2.y);
  }

  void attack() {
    if (level == 3) {                                                      //if it is level 3
      loc.add(vel);                                                        //add velocity to make hanz move
      loc2.add(vel2);
    }
  }
 void elliminate() {
    if (loc.dist(OlafLoc) <=140) {                                        //if hanz location is same as olaf's
      println("dead");
      vel = new PVector(0, 0);                                            //stop moving
      stage = 5;                                                          //change to stage 5 (lose)
    }
    if (loc2.dist(OlafLoc) <= 150) {                                      //if hanz location is same as olaf's
      vel2 = new PVector(0, 0);                                          //stop moving
      stage = 5;                                                        //change to stage 5 (lose)
    }
  }
}

