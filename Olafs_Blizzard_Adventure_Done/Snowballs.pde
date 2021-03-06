//CLASS
class Bullet {
  PVector loc, vel, acc;                                                          //Pvectors for location, velocity, acceleration
  float sz;                                                                        //float for size

  //CONSTRUCTOR  
  Bullet(float x_, float y_, float vx_, float vy_, 
  float ax_, float ay_, float sz_) {                                              //Parameters for the bullet constructor
    loc = new PVector(x_, y_);                                                    //location of the bullet
    vel = new PVector(vx_, vy_);                                                  //velocity of the bullet
    acc = new PVector(ax_, ay_);                                                  //acceleration of the bulet
    sz=sz_;
  }
  //METHODS
  void display() {                                                                //method for the display of the bullet
    stroke(0, 255, 150);                                                          //removing the stroke of the bullet 
    fill(255);                                                                    //the color of the bullet 
    ellipse(loc.x, loc.y, 15, 15);                                                //the shape of the bullet
  }

  void move() {                                                                    //method for the movement of the bullet
    vel.add(acc);                                                                 //adding acceleration to the velocity of the bullet
    loc.add(vel);                                                                //adding velocity to the location of the bullet
  }
  void hit(Wolves w) {                                                            //hit wolves
    if (loc.dist(w.loc) <= 40 ) {                                                 //if location of bullet is the same as wolf
      println("hit");
      w.loc = new PVector(random(-3000, -200), height-50);                       //move off left of screen
      w.vel = new PVector(0, 0);                                                 //no velocity
      sz = 0;
      loc = new PVector(0, 0);
      num--;
      println(num);
    }
    if (loc.dist(w.loc2) <= 40) {                                                //if location of bullet is the same as wolf
      w.loc2 = new PVector(random(width+200, width+3000), height-50);            //move wolf off right of screen
      w.vel2 = new PVector(0, 0);                                                //no velocity
      sz = 0;
      loc = new PVector(width+100000, width+1000000);
      num--;
      println(num);
    }
  }
  void hit2(Marshmallows m) {                                                      //hit marshmallows
    if (loc.dist(m.loc) <= 50) {                                                   //if loc of bullet is same as marshmallow
      m.loc = new PVector(random(-500, -150), height-105);                         //move marshmallow off screen
      m.vel = new PVector(0, 0);                                                   //no velocity
    }
    if (loc.dist(m.loc2) <= 50) {                                                  //if loc of bullet is same as marshmallow
      m.loc2 = new PVector(random(width+200, width+3000), height-105);             //move marshmallow off screen
      m.vel2 = new PVector(0, 0);                                                  //no velocity
    }
  }
  void hit3(Hanz h) {                                                              //hit hanza
    if (loc.dist(h.loc) <= 80) {                                                   //if loc of bullet is same as hanz
      h.loc = new PVector(random(-2500, -100), height-155);                        //move hanz off screen
      h.vel = new PVector(0, 0);                                                   //no velocity
    }
    if (loc.dist(h.loc2) <= 80){                                                   //if loc of bullet is same as hanz
      h.loc2 = new PVector(random(width+100, width+2500), height-155);             //move hanz off screen 
      h.vel2 = new PVector(0, 0);                                                  //no velocity
    }
  }
}

