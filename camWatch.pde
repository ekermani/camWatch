import processing.video.*;
Capture cam;

PImage bars;
PImage selfie;

int cam_height ;
int cam_width;

void setup() {
  size(500, 600);  
  cam = new Capture(this, 640, 600);  //CHECK THE SIZE
  cam.start(); 

  bars = loadImage("images/watchFrameBars.png");

  noStroke();
  background(255);
  
  selfie = createImage(cam_width, cam_height, 
}

void draw() {
  if (cam.available()) {
    cam.read();
    pushMatrix();
    translate(width/2, height/2);
    imageMode(CENTER);
    image(cam, 0, 0); //load cam at 0,0
    //image(selfie, );
    popMatrix();
  }
  imageMode(CORNER);
  image(bars, 0, 0);
}
/*do I need a frameCount value*/


void mousePressed() {
  saveFrame("images/##.png");
}
//PImage = new 
//load saved image