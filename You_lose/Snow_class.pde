//CLASS
class Starfield {
  ArrayList stars;//ArrayList for stars

//CONSTRUCTOR   
  Starfield() {
    stars = new ArrayList();//initializing the stars ArrayList
    for (int i = 0; i < 300; i++) {//setting parameters for multiple variables
      Star s = new Star();
      s.x = random(0, width);
      s.y = random(0, height);
      s.size = random(1, 10);
      stars.add(s);
    }
  }

//METHODS   
  void draw() {//method for drawing the starfield 
    for (int i = 0; i < stars.size(); i++) {//setting draw parameters
      Star s = (Star)stars.get(i);
      s.y += s.size;
      fill(255);
      noStroke();
      ellipse(s.x, s.y, s.size, s.size);
      if (s.y > height+10) {
        s.x = random(0, width);
        s.y = random(-30, 0);
        s.size = random(1, 15);
      }
    }
  }
}
//SEPERATE CLASS FOR THE STARS 
class Star {
  float x;//float for x coordinate
  float y;//float for y coordinate 
  float size;//float for size
}
