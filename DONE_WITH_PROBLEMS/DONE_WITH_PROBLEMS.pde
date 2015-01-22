ArrayList <Bullet> bullets = new ArrayList <Bullet>(); //Array list for class Bullet

int stage;
PVector OlafLoc;
int num = 40;
int level = 1;
float vy = -5.5;
//int Olafy = height+705;
//int Olafx = width+500;
//IMAGES
PImage Olaf;
PImage OlafBack;
PImage Background; 
Wolves[] wolves = new Wolves[num];
Marshmallows[] marshmallows = new Marshmallows[20];
Hanz[] hanz = new Hanz[10];

// Main Menu initialization
// intialize images
PImage Frozen;



PImage Inst;

//initialize restartbutton locations
PImage restartbutton;
//initialize exitbutton locations

int count = 250;

//call class

PImage WON;
PImage Olafmenu;
PImage Startbutton;
PImage Exitbutton;
PImage Snowhill;
int Startbuttony;
int Startbuttonx;
int restartbuttony;
int restartbuttonx;
int exitbuttony;
int exitbuttonx;
//THIRD


//FOURTH

PImage lose;
//PImage Olafmenu;
PImage restart2;
PImage exit2button;
//PImage Snowhill;
int restart2y;
int restart2x;
int exit2buttony;
int exit2buttonx;
Starfield starfield;


void setup() {
  Inst = loadImage("Instruc.jpg");
  //stage 1
  OlafLoc = new PVector(width+500, height-705);
  stage = 1;
  Frozen = loadImage("Frozen_s_Poster_step_1_8.jpg");
  Snowhill = loadImage("snowhill.jpg");
  size(Frozen.width, Frozen.height);
  Startbutton = loadImage("Start.png");
  Exitbutton = loadImage("ExitButton.png");
 
  imageMode(CENTER);
  restartbuttonx=width/2+200;
  restartbuttony=height/2;
  starfield = new Starfield();

  //THRID STAAGE
  restartbutton = loadImage("Restart.png");
  WON = loadImage("WON.jpg");
  size(WON.width, WON.height);
  Startbutton = loadImage("Start.png");
  Exitbutton = loadImage("ExitButton.png");
  Snowhill= loadImage("snowhill.jpg");
  Startbuttonx= width/3-100;
  Startbuttony= height/2+70;
  exitbuttonx= width/2+250;
  exitbuttony= height/2+70;
  noStroke();
  fill(255, 200);
  //Forth
  lose = loadImage("Lose one.jpg");

  restart2 = loadImage("restart2.png");
  exit2button = loadImage("ExitButtonlose.png");
  restart2x= width/2-220;
  restart2y= height/2+20;
  exit2buttonx= width/2-40;
  exit2buttony= height/2+20;
  starfield = new Starfield();


  // woid setup for stage 2
  Olaf = loadImage("Olaf Walking 3.png");//Loading the spaceship image
  OlafBack = loadImage("Olaf Walking Back 3.png");
  Background = loadImage("pine-trees-snow.jpg");
  for (int w=0; w<wolves.length; w++) {
    wolves[w] = new Wolves(random(50, 100), random(3, 3));
  }
  for (int i=0; i<marshmallows.length; i++) {
    marshmallows[i] = new Marshmallows(random(50, 80), random(20, 20));
  }
  for (int j=0; j<hanz.length; j++) {
    hanz[j] = new Hanz(random(50, 80), random(3, 3));
  }

  size(Background.width, Background.height);//size of canvas
  noStroke();
}

void draw() {
if (stage==0){stage=1;} 
  if (stage == 1) {
    imageMode(CENTER);
    background(Frozen);
    imageMode(CENTER);
    starfield.draw();
     Startbuttonx= width/3-100;
  Startbuttony= height/2+70;
    exitbuttonx= width/2+250;
    exitbuttony= height/2+70;
    image(Startbutton, Startbuttonx, Startbuttony);
    image(Exitbutton, exitbuttonx, exitbuttony);
    if (mouseX>exitbuttonx-80 && mouseX<exitbuttonx+80 && mouseY>exitbuttony-30 && mouseY<exitbuttony+30) {
      if (mousePressed == true) {
        exit();
      }
    }

    if (mouseX>Startbuttonx-80 && mouseX<Startbuttonx+80 && mouseY>Startbuttony-30 && mouseY<Startbuttony+30) {
      if (mousePressed == true) {
        stage=2;
      }
    }
    if (mouseX>exitbuttonx-80 && mouseX<exitbuttonx+80 && mouseY>exitbuttony-30 && mouseY<exitbuttony+30) {
      if (mousePressed == true) {
        exit();
      }
    }
  }
if (stage ==2){
  background (Inst);
   Startbuttonx= width/2;
  Startbuttony= height- 60;
   image(Startbutton, Startbuttonx, Startbuttony);
    if (mouseX>Startbuttonx-80 && mouseX<Startbuttonx+80 && mouseY>Startbuttony-30 && mouseY<Startbuttony+30) {
      if (mousePressed == true) {
        stage=3;
      }
    }
}
  if (stage == 3) {
    background(Background);
    if (mouseX <= width/2) {
      image(Olaf, OlafLoc.x, OlafLoc.y);
    } else {
      image(OlafBack, OlafLoc.x, OlafLoc.y);
    }    
    for (int i=0; i<wolves.length; i++) {
      wolves[i].display();
      wolves[i].attack();
      wolves[i].elliminate();
    }
    for (int j=0; j<marshmallows.length; j++) {
      marshmallows[j].display();
      marshmallows[j].attack();
    }
    for (int k=0; k<hanz.length; k++) {
      hanz[k].display();
      hanz[k].attack();
    }
    for (int j = bullets.size ()-1; j>=0; j--) {//setting the functions for the bullet projectiles
      Bullet b = bullets.get(j);
      b.display();
      b.move();
      for (int i=0; i<wolves.length; i++) {
        b.hit(wolves[i]);
      }
      for (int m=0; m<marshmallows.length; m++) {
        b.hit2(marshmallows[m]);
      }
      for (int h=0; h<hanz.length; h++) {
        b.hit3(hanz[h]);
      }
    }
    if (keyPressed) {
      if (key == 'd') {
        OlafLoc.x+= 10;
      }
      if (keyPressed) {
        if (key == 'a') {
          OlafLoc.x-= 10;
        }
        if (OlafLoc.x >= width) {
          OlafLoc.x = 300;
          level++;
          println(level);
        }
        OlafLoc.y = constrain(OlafLoc.y, height-78, height);
      }
    }
    if (num == -50) {
      println("win");
    }
  }
  if (level == 4) {
    stage= 4;
  }
  if (stage == 4) {
    background(WON);
    imageMode(CENTER);
    image(restartbutton, restartbuttonx, restartbuttony);
    image(Exitbutton, exitbuttonx, exitbuttony);
    if (mouseX>restartbuttonx-80 && mouseX<restartbuttonx+80 && mouseY>restartbuttony-30 && mouseY<restartbuttony+30) {
      if (mousePressed == true) {
         stage = 3;
        background(Background);
    if (mouseX <= width/2) {
      image(Olaf, OlafLoc.x, OlafLoc.y);
    } else {
      image(OlafBack, OlafLoc.x, OlafLoc.y);
    }    
    for (int i=0; i<wolves.length; i++) {
      wolves[i].display();
      wolves[i].attack();
      wolves[i].elliminate();
    }
    for (int j=0; j<marshmallows.length; j++) {
      marshmallows[j].display();
      marshmallows[j].attack();
    }
    for (int k=0; k<hanz.length; k++) {
      hanz[k].display();
      hanz[k].attack();
    }
    for (int j = bullets.size ()-1; j>=0; j--) {//setting the functions for the bullet projectiles
      Bullet b = bullets.get(j);
      b.display();
      b.move();
      for (int i=0; i<wolves.length; i++) {
        b.hit(wolves[i]);
      }
      for (int m=0; m<marshmallows.length; m++) {
        b.hit2(marshmallows[m]);
      }
      for (int h=0; h<hanz.length; h++) {
        b.hit3(hanz[h]);
      }
    }
    if (keyPressed) {
      if (key == 'd') {
        OlafLoc.x+= 10;
      }
      if (keyPressed) {
        if (key == 'a') {
          OlafLoc.x-= 10;
        }
        if (OlafLoc.x >= width) {
          OlafLoc.x = 300;
          level++;
          println(level);
        }
        OlafLoc.y = constrain(OlafLoc.y, height-78, height);
      }
    }
    if (num == -50) {
      println("win");
    }
      }
    }


    exitbuttonx= width/2+400;
    exitbuttony= height/2;
    if (mouseX>exitbuttonx-80 && mouseX<exitbuttonx+80 && mouseY>exitbuttony-30 && mouseY<exitbuttony+30) {
      if (mousePressed == true) {
        exit();
      }
    }
  }
  if (stage==5) {
    background(lose);
    imageMode(CENTER);

    starfield.draw();
    //image(Olafmenu, width/2, height/2+70) ;
    image(restart2, restart2x, restart2y);
    image(exit2button, exit2buttonx, exit2buttony);
    if (mouseX>restart2x-80 && mouseX<restart2x+80 && mouseY>restart2y-30 && mouseY<restart2y+30) {
      if (mousePressed == true) {
        //
      }
    }
    if (mouseX>exit2buttonx-80 && mouseX<exit2buttonx+80 && mouseY>exit2buttony-30 && mouseY<exit2buttony+30) {
      if (mousePressed == true) {
        exit();
      }
    }
  }
}


void mousePressed() {//setting the function of the mouse button being pressed
  if (mouseX <= width/2) {
    bullets.add(new Bullet(OlafLoc.x-28, OlafLoc.y+20, -30, vy, .1, .5, 4));
  } else {
    bullets.add(new Bullet(OlafLoc.x+35, OlafLoc.y+20, 30, vy, .1, .5, 4));
  }
  if (level == 3) {
    vy = -10;
  }
}

