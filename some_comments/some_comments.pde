ArrayList <Bullet> bullets = new ArrayList <Bullet>();           //Array list for class Bullet

int stage;
PVector OlafLoc;
int num = 40;
int level = 1;
float vy = -5.5;

            //intialize PImages
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

Blizzard Blizzard;                                                                                               //call the snow class


void setup() {
  //FIRST STAGE
  OlafLoc = new PVector(width+500, height-450);
  stage = 1;
  Frozen = loadImage("Frozen_s_Poster_step_1_8.jpg");
  Snowhill = loadImage("snowhill.jpg");
  size(Frozen.width, Frozen.height);
  Startbutton = loadImage("Start.png");
  Exitbutton = loadImage("ExitButton.png");
  
  Blizzard = new Blizzard();                                                                                      //snow

  //SECOND STAGE
  Inst = loadImage("Instruc.jpg");                                                                                 //load image

  //THRID STAGE
  WON = loadImage("WON.jpg");                                                                                      //load image
  size(WON.width, WON.height);                                                                                     
  Startbuttonx= width/3-100;                                                                                       //start button locations
  Startbuttony= height/2+70;
  exitbuttonx= width/2;                                                                                            //exit button locations
  exitbuttony= height/2+70;
  noStroke();
  fill(255, 200);


  //FOURTH STAGE
  lose = loadImage("Lose one.jpg");                                                                                //load various images
  exit2button = loadImage("ExitButtonlose.png");
  exit2buttonx= width/2-190;                                                                                       //the exit button locations
  exit2buttony= height/2;
  Blizzard = new Blizzard();                                                                                      //snow

  // void setup for stage 2
  Olaf = loadImage("Olaf Walking 3.png");                                                                            //load various images
  OlafBack = loadImage("Olaf Walking Back 3.png");
  Background = loadImage("pine-trees-snow.jpg");
  for (int w=0; w<wolves.length; w++) {                                                                              //wolves array
    wolves[w] = new Wolves(random(50, 100), random(3, 3));
  }
  for (int i=0; i<marshmallows.length; i++) {
    marshmallows[i] = new Marshmallows(random(50, 80), random(20, 20));                                            //marshmallow array
  }
  for (int j=0; j<hanz.length; j++) {
    hanz[j] = new Hanz(random(50, 80), random(3, 3));                                                              //hanz array
  }
  size(Background.width, Background.height);                                                                      //the size of screen is the size of the image 
  noStroke();
}

void draw() {
  if (stage==0) {                                                                                                     //change to stage 1
    stage=1;
  } 
  if (stage == 1) {                                                                                                   //if it is stage 1
    imageMode(CENTER);
    background(Frozen);                                                                                               //display background
    Blizzard.draw();                                                                                                  //make it snow
    Startbuttonx= width/3-100;                                                                                        //startbutton locations
    Startbuttony= height/2+70;
    exitbuttonx= width/2+250;                                                                                         //exitbutton locations
    exitbuttony= height/2+70;
    image(Startbutton, Startbuttonx, Startbuttony);                                                                   //display images for buttons
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
    for (int i=0; i<wolves.length; i++) {                                                                          //add wolves
      wolves[i].display();
      wolves[i].attack();
      wolves[i].elliminate();
    }
    for (int j=0; j<marshmallows.length; j++) {                                                                    //add marshmallows
      marshmallows[j].display();
      marshmallows[j].attack();
      marshmallows[j].elliminate();
    }
    for (int k=0; k<hanz.length; k++) {                                                                            //add hanz
      hanz[k].display();
      hanz[k].attack();
      hanz[k].elliminate();
    }
    for (int j = bullets.size ()-1; j>=0; j--) {                                                                  //bullets
      Bullet b = bullets.get(j);                                                                                  //get bullets
      b.display();
      b.move();
      for (int i=0; i<wolves.length; i++) {                                                                      //hit wolves
        b.hit(wolves[i]);
      }
      for (int m=0; m<marshmallows.length; m++) {                                                                //hit marshmallows
        b.hit2(marshmallows[m]);
      }
      for (int h=0; h<hanz.length; h++) {                                                                        //hit hanz
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

    if (mousePressed) {                                                                                            //if the mouse is pressed
      stage = 3;                                                                                                   //change to satege 3
      background(Background);                                                                                      //change the background
      if (mouseX <= width/2) {                                                                                     //if the mouse is on the left half of the screen
        image(Olaf, OlafLoc.x, OlafLoc.y);                                                                         //display olaf facing left
      } else {                                                                                                     //or
        image(OlafBack, OlafLoc.x, OlafLoc.y);                                                                     //display olaf facing right
      }    
      for (int i=0; i<wolves.length; i++) {                                                                        //add wolves
        wolves[i].display();
        wolves[i].attack();
        wolves[i].elliminate();
      }
      for (int j=0; j<marshmallows.length; j++) {                                                                  //add marshmallows 
        marshmallows[j].display();
        marshmallows[j].attack();
      }
      for (int k=0; k<hanz.length; k++) {                                                                          //add hanz
        hanz[k].display();
        hanz[k].attack();
      }
        for (int j = bullets.size ()-1; j>=0; j--) {                                                               //bullets
        Bullet b = bullets.get(j);                                                                                 //get bullets
        b.display();
        b.move();
        for (int i=0; i<wolves.length; i++) {                                                                     //hit wolves
          b.hit(wolves[i]);
        }
        for (int m=0; m<marshmallows.length; m++) {                                                              //hit marshmallows
          b.hit2(marshmallows[m]);
        }
        for (int h=0; h<hanz.length; h++) {                                                                      //hit hanz
          b.hit3(hanz[h]);
        }
      }
      if (keyPressed) {                                                                                         //if 'd' key is pressed
        if (key == 'd') {
          OlafLoc.x+= 10;                                                                                       //move olaf to the right
        }
        if (keyPressed) {                                                                                       //if 'a' key is pressed
          if (key == 'a') {
            OlafLoc.x-= 10;                                                                                     //move olaf to the left
          }
          if (OlafLoc.x >= width) {                                                                            //if location of olaf is off the right of the screen
            OlafLoc.x = 300;                                                                                   //move olaf to the left of the screen
            level++;                                                                                           //increase level
            println(level);
          }
          OlafLoc.y = constrain(OlafLoc.y, height-78, height);                                                //constrain the y location of olaf
        }
      }
      if (num == -50) {
        println("win");
      }
    }
  }
  exitbuttonx= width/2+400;                                                                                  //exit button locations
  exitbuttony= height/2;
  if (mouseX>exitbuttonx-80 && mouseX<exitbuttonx+80 && mouseY>exitbuttony-30 && mouseY<exitbuttony+30) {    //if the mouse is in the are of the exit button
    if (mousePressed == true) {                                                                              //and mouse is pressed
      exit();                                                                                                //exit program
    }
  }
  if (stage==5) {                                                                                            //if it is stage 5
    background(lose);                                                                                        //change background to lose

    Blizzard.draw();                                                                                        //make it snow
    image(exit2button, exit2buttonx, exit2buttony);                                                         //image of exit button
  }
  if (mouseX>exitbuttonx-80 && mouseX<exitbuttonx+80 && mouseY>exitbuttony-30 && mouseY<exitbuttony+30) {    //if the mouse is in the are of the exit button
    if (mousePressed == true) {                                                                              //and mouse is pressed
      exit();                                                                                                //exit program
    }
  }
}


void mousePressed() {                                                                                      //mouse pressed functions
  if (mouseX <= width/2) {                                                                                 //if mouse is on the left half of the screen
    bullets.add(new Bullet(OlafLoc.x-28, OlafLoc.y+20, -30, vy, .1, .5, 4));                               //add a bullet going in the left direction 
  } else {                                                                                                 //or
    bullets.add(new Bullet(OlafLoc.x+35, OlafLoc.y+20, 30, vy, .1, .5, 4));                                //add a bullet going in the right direction
  }
  if (level == 3) {                                                                                        //if it is level 3
    vy = -10;                                                                                              //slow the velocity
  }
}

