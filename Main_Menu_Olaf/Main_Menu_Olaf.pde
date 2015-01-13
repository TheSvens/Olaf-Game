PImage Frozen;
PImage Olafmenu;

void setup(){
  Frozen = loadImage("Frozen_s_Poster_step_1_9.jpg");
  size(Frozen.width, Frozen.height);
  Olafmenu = loadImage("Untitled-2.png");
  
  
}

void draw(){
  background(Frozen);
  text("Olaf's Blizzard", width/5.7, height/5);
  textSize(80);
  text("Adventure", width/3.5, height/3);
  imageMode(CENTER);
image(Olafmenu, width/2, height/2+70) ;
}
