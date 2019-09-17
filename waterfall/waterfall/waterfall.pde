int xLen = 0;
int xGrow = 3;
int goodToGo = 0;
int ceilingTime = 0;

int xPos = 0;
int xShrink = 0;

int yLen = 107;
int yGrow = 3;
int yPos = 800;
int yShrink = 0;

int savedTime;
float totalTime;

float beginX = 20.0;  // Initial x-coordinate
float beginY = 10.0;  // Initial y-coordinate
float endX = 570.0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX;          // X-axis distance to move
float distY;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)

void setup() {
  // setup processing interface
  fullScreen();
  noStroke();  
 // savedTime = millis();

}



void drawPipeline()
{
 rect(xPos, yPos, xLen, yLen);
 
  //xLen = 1;
  //xGrow = 1;
 
 if (xLen >= 1130)
 {
  goodToGo = 0;
  xShrink = 3;
  xGrow = -3;
  println("ceiling yes  = 1 this time around");
 }
   
 if (xLen <= 0 && xPos > 0)
 {
   xGrow = 0;
   xShrink = 0;
   //xLen = 0;
   xPos = 1259;
   yPos = 0;
   xLen = 600;
   yLen = 0;
   
   ceilingTime = 1;
   
   
 }
 if (yLen >= 1078 && ceilingTime == 1)
 {
  yShrink = 3;
  yGrow = -3;
 } 
 else if (ceilingTime == 1 && (yLen <= 0 && yPos > 0))
 {
   yGrow = 0;
   yShrink = 0;
   yLen = 0;
   yPos = 0;
 }
 
 if (ceilingTime == 1)
 {
   yLen = yLen + yGrow;
   yPos = yPos + yShrink;
 }
 

 
 if (goodToGo == 1 && (second() % 7 == 3 && ceilingTime == 0)) //modulo gets us a more "random" time
 {
   //xLen = 0;
   xGrow = 3;
   fill(0, 0, random(102, 255));
 }
 
    //xPos = xPos + xShrink;
   xLen = xLen + xGrow;
   xPos = xPos + xShrink;
}


void draw(){
  background(204);
 // totalTime = random(10000, 20000);
  drawPipeline();

 //  drawCeilingWater();
    //ceilingYes = 0;
  
}
