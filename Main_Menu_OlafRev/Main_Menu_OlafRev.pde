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
  Frozen = loadImage("Frozen_s_Poster_step_1_8.jpg");
 Snowhill = loadImage("snowhill.jpg");
  size(Frozen.width, Frozen.height);
  Startbutton = loadImage("Start.png");
  Exitbutton = loadImage("ExitButton.png");
  Startbuttonx= width/3-100;
  Startbuttony= height/2+70;
  exitbuttonx= width/2+250;
  exitbuttony= height/2+70;
}

void draw() {
  background(Frozen);
  imageMode(CENTER);

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


