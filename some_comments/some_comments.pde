ArrayList <Bullet> bullets = new ArrayList <Bullet>(); //Array list for class Bullet

int stage;
PVector OlafLoc;
int num = 40;
int level = 1;
float vy = -5.5;

//intialize images
PImage Olaf;
PImage OlafBack;
PImage Background; 
PImage Frozen;
PImage Inst;
PImage WON;
PImage Olafmenu;
PImage Startbutton;
PImage Exitbutton;
PImage Snowhill;
PImage lose;
PImage exit2button;

//arrays for enemy classes
Wolves[] wolves = new Wolves[num];
Marshmallows[] marshmallows = new Marshmallows[20];
Hanz[] hanz = new Hanz[10];

//intitialize integers for button locations
int Startbuttony;
int Startbuttonx;
int exitbuttony;
int exitbuttonx;
int exit2buttony;
int exit2buttonx;

Blizzard Blizzard;     //call the snow class


void setup() {
  //FIRST STAGE
  OlafLoc = new PVector(width+500, height-450);
  stage = 1;
  Frozen = loadImage("Frozen_s_Poster_step_1_8.jpg");
  Snowhill = loadImage("snowhill.jpg");
  size(Frozen.width, Frozen.height);
  Startbutton = loadImage("Start.png");
  Exitbutton = loadImage("ExitButton.png");

  Blizzard = new Blizzard();

  //SECOND STAGE
  Inst = loadImage("Instruc.jpg");

  //THRID STAGE
  WON = loadImage("WON.jpg");
  size(WON.width, WON.height);
  Startbuttonx= width/3-100;
  Startbuttony= height/2+70;
  exitbuttonx= width/2;
  exitbuttony= height/2+70;
  noStroke();
  fill(255, 200);


  //FOURTH STAGE
  lose = loadImage("Lose one.jpg");
  exit2button = loadImage("ExitButtonlose.png");
  exit2buttonx= width/2-190;
  exit2buttony= height/2;
  Blizzard = new Blizzard();

  // void setup for stage 2
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
  if (stage==0) {                       //change to stage 1
    stage=1;
  } 
  if (stage == 1) {                     //when it is stage 1
    imageMode(CENTER);
    background(Frozen);                 //display background
    Blizzard.draw();                    //make it snow
    Startbuttonx= width/3-100;          //startbutton locations
    Startbuttony= height/2+70;
    exitbuttonx= width/2+250;           //exitbutton locations
    exitbuttony= height/2+70;
    image(Startbutton, Startbuttonx, Startbuttony);      //display images for buttons
    image(Exitbutton, exitbuttonx, exitbuttony);
    if (mouseX>exitbuttonx-80 && mouseX<exitbuttonx+80 && mouseY>exitbuttony-30 && mouseY<exitbuttony+30) {          //if mouse is in area of the exit button
      if (mousePressed == true) {                                                                                    //and mouse is pressed
        exit();                                                                                                      //exit program
      }
    }
    if (mouseX>Startbuttonx-80 && mouseX<Startbuttonx+80 && mouseY>Startbuttony-30 && mouseY<Startbuttony+30) {      //if mouse is in area of start button
      if (mousePressed == true) {                                                                                    //and mouse is pressed
        stage=2;                                                                                                     //move to stage 2
      }
    }
  }
  if (stage ==2) {                                                                                                  //if stage 2
    background (Inst);                                                                                              //change background to instructions
    Startbuttonx= width/2;                                                                                          //start button locations
    Startbuttony= height- 60;
    image(Startbutton, Startbuttonx, Startbuttony);                                                                //start button image
    if (mouseX>Startbuttonx-80 && mouseX<Startbuttonx+80 && mouseY>Startbuttony-30 && mouseY<Startbuttony+30) {    //if the mouse is in the area of the start button
      if (mousePressed == true) {                                                                                  //and mouse is pressed
        stage=3;                                                                                                   //move to stage 3
      }
    }
  }
  if (stage == 3) {                                                                                                //if stage 3
    background(Background);                                                                                        //change the background
    if (mouseX <= width/2) {                                                                                       //if the mouse is on the left side of the screen
      image(Olaf, OlafLoc.x, OlafLoc.y);                                                                           //display the olaf image facing left
    } else {                                                                                                       //otherwise
      image(OlafBack, OlafLoc.x, OlafLoc.y);                                                                       //display the olaf image facing right
    }    
    for (int i=0; i<wolves.length; i++) {                                                                          //add the wolves
      wolves[i].display();
      wolves[i].attack();
      wolves[i].elliminate();
    }
    for (int j=0; j<marshmallows.length; j++) {                                                                    //add the marshmallows
      marshmallows[j].display();
      marshmallows[j].attack();
      marshmallows[j].elliminate();
    }
    for (int k=0; k<hanz.length; k++) {                                                                            //add the hanz
      hanz[k].display();
      hanz[k].attack();
      hanz[k].elliminate();
    }
    for (int j = bullets.size ()-1; j>=0; j--) {                                                                  //setting for the bullet projectiles
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
      if (key == 'd') {                                                                                             //if the 'd' key is pressed
        OlafLoc.x+= 10;                                                                                             //move olaf to the right
      }
      if (key == 'a') {                                                                                             //if the 'a' key is pressed
        OlafLoc.x-= 10;                                                                                             //move olaf to the left
      }
    }
    if (OlafLoc.x >= width) {                                                                                      //if you olaf is moved off the screen to the right
      OlafLoc.x = 300;                                                                                             //start olaf at the left of the screen
      level++;                                                                                                     //and increase level
      println(level);
    }
    OlafLoc.y = constrain(OlafLoc.y, height-60, height);                                                           //constrain the y location of olaf
  }
  if (num == -50) {
    println("win");
  }
  if (level == 4) {                                                                                                //if it is level 4
    stage= 4;                                                                                                      //change to stage 4
  }
  if (stage == 4) {                                                                                                //if it is stage 4
    background(WON);                                                                                               //change background to you won image

    image(Exitbutton, exitbuttonx, exitbuttony);                                                                   //display the exit button

    if (mousePressed) {
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
  if (stage==5) {
    background(lose);

    Blizzard.draw();
    image(exit2button, exit2buttonx, exit2buttony);    //image(Olafmenu, width/2, height/2+70)
  }
  if (mouseX>exit2buttonx-80 && mouseX<exit2buttonx+80 && mouseY>exit2buttony-30 && mouseY<exit2buttony+30) {
    if (mousePressed == true) {
      exit();
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

