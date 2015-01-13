PImage Frozen;
PImage Olafmenu;
PImage Startbutton;
PImage Exitbutton;
int startbuttony;
int startbuttonx;
int exitbuttony;
int exitbuttonx;

void setup(){
  Frozen = loadImage("Frozen_s_Poster_step_1_9.jpg");
  size(Frozen.width, Frozen.height);
  Olafmenu = loadImage("Untitled-2.png");
  Startbutton = loadImage("Start.png");
  Exitbutton = loadImage("ExitButton.png");
  startbuttonx= width/3-100;
  startbuttony= height/2+70;
  exitbuttonx= width/2+250;
  exitbuttony= height/2+70;
}

void draw(){
  background(Frozen);
  text("Olaf's Blizzard", width/5.7, height/5);
  textSize(80);
  text("Adventure", width/3.5, height/3);
  imageMode(CENTER);
image(Olafmenu, width/2, height/2+70) ;
image(Startbutton, startbuttonx, startbuttony);
image(Exitbutton, exitbuttonx, exitbuttony);
if mouseX>startbuttonx-80 & 
}
