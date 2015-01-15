

PImage Frozen;
PImage Olafmenu;
PImage Startbutton;
PImage Exitbutton;
PImage Snowhill;
int Startbuttony;
int Startbuttonx;

int exitbuttony;
int exitbuttonx;
int count = 250;
  PImage snowflake;

  PVector[] loc = new PVector[count];
  PVector[] vel = new PVector[count];
  PVector[] acc = new PVector[count];
  float[] sz = new float[count];
  float[] theta = new float[count];
  float[] spin = new float[count];
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
  imageMode(CENTER);
    snowflake = loadImage("flake.png");

    //initialize variables
    for (int i = 0; i < count; i++) {
      sz[i] = random(10, 40);
      loc[i] = new PVector(random(width), random(-height*1.5, -sz[i]/2));
      vel[i] = new PVector(0, random(1));
      acc[i] = new PVector(0, .01);
      theta[i] = random(TWO_PI);
      spin[i] = random(-.01, .01);
    }
    noStroke();
    fill(255, 200);
  }


void draw() {
  background(Frozen);
  imageMode(CENTER);

  image(Startbutton, Startbuttonx, Startbuttony);
  image(Exitbutton, exitbuttonx, exitbuttony);

  for (int i = 0; i < count; i++) {
      //move snowflake
      vel[i].add(acc[i]);
      loc[i].add(vel[i]);
      vel[i].limit(3);
      //draw snowflake
      pushMatrix();
      translate(loc[i].x, loc[i].y);
      rotate(theta[i]);
      image(snowflake, 0, 0, sz[i], sz[i]);
      popMatrix();
      //change horizontal acceleration
      acc[i].x = random(-.05, .05);
      //spin
      theta[i] += spin[i];
      //restart snowflake
      if (loc[i].y - sz[i]/2 > height) {
        loc[i].set(random(width), random(-height, -sz[i]/2));
        vel[i].set(0, 1);
      }
    }

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

