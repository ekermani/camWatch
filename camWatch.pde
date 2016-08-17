import processing.video.*;
Capture cam;

PImage bars;

int index=0;

PImage[] pictures = new PImage[index];

boolean modeA = true;

void setup() {
  size(500, 600);  
  cam = new Capture(this, 640, 600);  //CHECK THE SIZE
  cam.start(); 

  bars = loadImage("images/watchFrameBars.png");

  noStroke();
  background(255);
}

void draw() {
  if (cam.available()) {
    cam.read();
    pushMatrix();
    translate(width/2, height/2);
    imageMode(CENTER);
    image(cam, 0, 0); //load cam at 0,0
    popMatrix();
  }
  imageMode(CORNER);
  image(bars, 0, 0);
  
  
  
}

void mousePressed() {
  saveFrame("data/"+index+".png");
  index++;
} 

void keyPressed(){
  if(key==' '){
    modeA = !modeA; //space bar toggles between modes
    image(cam,0,0);
    println(modeA);
  } else {image(pictures[index],0,0);
  }
}

//inside image clock if statement, condition...