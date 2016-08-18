import processing.video.*;
Capture cam;

PFont font;
PImage bars;
PImage img; 

float r; 
float s1; 
float s2; 
boolean modeA = true;
int a = 0;
int counter = 0;
int clockStart;

void setup() {
  clockStart = millis();
  font = loadFont("OCRAStd-48.vlw");

  size(500, 600);  
  cam = new Capture(this, 640, 600);  //CHECK THE SIZE
  cam.start(); 

  bars = loadImage("images/watchFrameBars.png");
  //s = second(); 
  noStroke();
  background(255);
}

void draw() {
  s2 = second(); 
  if (cam.available()) {
    cam.read();
  }
  if (modeA) {
    pushMatrix();
    translate(width/2, height/2);
    imageMode(CENTER);
    image(cam, 0, 0); //load cam at 0,0
    popMatrix();
  }
  imageMode(CORNER);
  image(bars, 0, 0);


  if (!modeA) {
    int hour = hour();
    int min = minute();
    int sec = second();
    int day = day();
    int mon = month();
   
     if (frameCount % 4== 0) {
      r+=1 ;
    } 
    img = loadImage("0.png"); 
    tint(0, 0, 0, r);
    image(img, 0, 0, width, height); 
   
    //println(r); 
    //if((s2-s1)>  ){  //currentTime > previousTime
    //  r++; 
    //}
  noTint();
    noStroke();
    fill(255);
    textSize(60);
    text((mon + ":" + day  + ":" + hour + ":" + min),250,50);
  }

 
}

void mousePressed() {
  if (modeA) {
    saveFrame("data/"+0+".png");
    modeA = false;
  }
} 