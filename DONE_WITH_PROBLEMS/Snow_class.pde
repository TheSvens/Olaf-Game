//CLASS
class Blizzard {
  ArrayList flakes;//ArrayList for snow

//CONSTRUCTOR   
  Blizzard() {
    flakes = new ArrayList();//initializing the flakes ArrayList
    for (int i = 0; i < 300; i++) {//setting parameters for multiple variables
      Flake s = new Flake();
      s.x = random(0, width);
      s.y = random(0, height);
      s.size = random(3, 5);
      flakes.add(s);
    }
  }

//METHODS   
  void draw() {//method for drawing the Blizzard 
    for (int i = 0; i < flakes.size(); i++) {//setting draw parameters
      Flake s = (Flake)flakes.get(i);
      s.y += s.size;
      fill(255);
      noStroke();
      ellipse(s.x, s.y, s.size, s.size);
      if (s.y > height+10) {
        s.x = random(0, width);
        s.y = random(-30, 0);
        s.size = random(1, 5);
      }
    }
  }
}
//SEPERATE CLASS FOR THE flakes 
class Flake {
  float x;//float for x coordinate
  float y;//float for y coordinate 
  float size;//float for size
}
