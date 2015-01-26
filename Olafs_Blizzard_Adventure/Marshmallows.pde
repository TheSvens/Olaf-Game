class Marshmallows {

  PImage marshmallow, marshmallowb;                                                  //marshmallow images
  PVector loc, loc2, vel, vel2;                                                      //pvectors for locations and velocities
  float sz, speed;                                                                   //float size and speed

  Marshmallows(float tempspd, float tempsz) {
    marshmallow = loadImage("golem guy back.png");                                   //load images
    marshmallowb = loadImage("golem guy.png");
    sz = tempsz;
    speed = tempspd;
    loc = new PVector(random(-3000, -200), height-105);                              //new pvectors
    loc2 = new PVector(random(width+200, width+3000), height-105);
    vel = new PVector(random(4, 5.5), random(0, 0));
    vel2 = new PVector(random(-4, -5.5), random(0, 0));
  }

  void display() {
    imageMode(CENTER);
    image(marshmallow, loc.x, loc.y);                                              //marshmallow locations
    image(marshmallowb, loc2.x, loc2.y);
  }

  void attack() {
    if(level == 2){                                                                //if it is level 2
      loc.add(vel);                                                                //make marshmallow move by adding velocity
      loc2.add(vel2);
    }
  }
   void elliminate() {
    if (loc.dist(OlafLoc) <=140) {                                                //if marshmallow touches olaf
      println("dead");  
      vel = new PVector(0, 0);                                                    //stop moving
      stage = 5;                                                                  //change to stage 5 (lose)
    }
    if (loc2.dist(OlafLoc) <= 150) {                                             //if marshmallow touches olaf
      vel2 = new PVector(0, 0);                                                  //stop moving
      stage = 5;                                                                 //change to stage 5 (lose)
    }
  }
}

