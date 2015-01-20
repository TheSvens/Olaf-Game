PImage Frozen;
//PImage Olafmenu;
PImage Restart;
PImage Exitbutton;
//PImage Snowhill;
int Restarty;
int Restartx;
int exitbuttony;
int exitbuttonx;

void setup() {
  Frozen = loadImage("Frozen_s_Poster_step_1_9.jpg");
  size(Frozen.width, Frozen.height);
  //Olafmenu = loadImage("Untitled-2.png");
  Restart = loadImage("Start.png");
  Exitbutton = loadImage("ExitButton.png");
  //
  Restartx= width/2+100;
  Restarty= height/2-20;
  exitbuttonx= width/2+280;
  exitbuttony= height/2-20;
}

void draw() {
  background(Frozen);
  imageMode(CENTER);
  //image(Olafmenu, width/2, height/2+70) ;
  image(Restart, Restartx, Restarty);
  image(Exitbutton, exitbuttonx, exitbuttony);
  if (mouseX>Restartx-80 && mouseX<Restartx+80 && mouseY>Restarty-30 && mouseY<Restarty+30) {
    if (mousePressed == true) {
      //
    }
  }
  if (mouseX>exitbuttonx-80 && mouseX<exitbuttonx+80 && mouseY>exitbuttony-30 && mouseY<exitbuttony+30) {
    if (mousePressed == true) {
      exit();
    }
  }
}

