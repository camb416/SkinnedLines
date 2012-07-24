import processing.opengl.*;

Line[] lines;
int screenW,screenH;

int numLines = 32;

AssetLibrary assets;
void setup() {
  assets = new AssetLibrary();
  screenW = 1280;
  screenH = 720;

  lines = new Line[numLines];
  for(int i=0;i<numLines;i++) {
    lines[i] = new Line(assets);
  }

  size(1280,720, OPENGL);
  smooth();
}
void draw() {
  background(0);
  stroke(255);
  
  for(int i=0;i<numLines;i++) {
    lines[i].update();
  }
  
  for(int i=0;i<numLines;i++) {
    lines[i].draw();
  }
}

class AssetLibrary {
  PImage lineSegment;
  PImage lineCap;
  AssetLibrary() {
    lineSegment = loadImage("lineSegment.png");
    lineCap = loadImage("lineCap.png");
  }
}

class Line {
  AssetLibrary assets;
  float x1,y1,x2,y2;
  float cx,cy;
  float dx,dy;
  float l;
  float r;
  Line(AssetLibrary _assets) {
    assets = _assets;
    x1 = random(screenW);
    y1 = random(screenH);
    x2 = random(screenW);
    y2 = random(screenH);
  } 
  void update(){
    dx = (x2-x1);
    dy = (y2-y1);
    r = atan2(dy,dx);
    l = dist(x1,y1,x2,y2);
  }
  void draw() {
  //  line(x1,y1,x2,y2);
  //  image(assets.lineSegment,x1,y1);
  tint(255,255,255,255);
    pushMatrix();
    translate(x1,y1);
    image(assets.lineCap,-assets.lineCap.width/2,-assets.lineCap.height/2);
    
    pushMatrix();
    
     translate(dx,dy);

    
//    translate(x2-x1,y2-y1);    
    image(assets.lineCap,-assets.lineCap.width/2,-assets.lineCap.height/2);
    popMatrix();
    //translate(dx/2,dy/2);
    pushMatrix();
  rotate(r);
     image(assets.lineSegment,0,-assets.lineSegment.height/2,l,assets.lineSegment.height);
  popMatrix();
   // ellipse(0,0,5,5);
     

    

    popMatrix();
      }
}

