PImage Frozen;
PImage Olafmenu;
PImage Startbutton;
PImage Exitbutton;
PImage Snowhill;
int Startbuttony;
int Startbuttonx;
int exitbuttony;
int exitbuttonx;

void setup() {
  Frozen = loadImage("Frozen_s_Poster_step_1_9.jpg");
  size(Frozen.width, Frozen.height);
  Olafmenu = loadImage("Untitled-2.png");
  Startbutton = loadImage("Start.png");
  Exitbutton = loadImage("ExitButton.png");
  Snowhill= loadImage("snowhill.jpg");
  Startbuttonx= width/3-100;
  Startbuttony= height/2+70;
  exitbuttonx= width/2+250;
  exitbuttony= height/2+70;
}

void draw() {
  background(Frozen);
  text("Olaf's Blizzard", width/5.7, height/5);
  textSize(80);
  text("Adventure", width/3.5, height/3);
  imageMode(CENTER);
  image(Olafmenu, width/2, height/2+70) ;
  image(Startbutton, Startbuttonx, Startbuttony);
  image(Exitbutton, exitbuttonx, exitbuttony);
  if (mouseX>Startbuttonx-80 && mouseX<Startbuttonx+80 && mouseY>Startbuttony-30 && mouseY<Startbuttony+30) {
    if (mousePressed == true) {
      image(Snowhill, width/2, height/2);
    }
  }
    if (mouseX>exitbuttonx-80 && mouseX<exitbuttonx+80 && mouseY>exitbuttony-30 && mouseY<exitbuttony+30) {
      if (mousePressed == true) {
        exit();
      }
    }
  }


