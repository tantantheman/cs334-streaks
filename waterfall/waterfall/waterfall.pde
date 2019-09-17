int xLen = 0;
int xGrow = 3;
int goodToGo = 1;
int ceilingTime = 2;
int newxLen;
int newxPos;
int xPos = 0;
int xShrink = 0;

int yLen = 107;
int yGrow = 3;
int yPos = 800;
int yShrink = 0;


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

}

void drawPipeline()
{
 rect(xPos, yPos, xLen, yLen);

 if (goodToGo == 2 && (second() % 7 == 3 && ceilingTime == 0)) //modulo gets us a more "random" time
 {
   //xLen = 0;
   goodToGo = 1;
   xGrow = 3;
   fill(0, 0, random(102, 255));
 }
 

  
  if (goodToGo == 1 && xLen >= 1130)
 {
    xShrink = 3;
    xGrow = -3;
 }
   
 if (goodToGo == 1 && xLen <= 0 && xPos > 0)
 {
   streamGenerator();
   xGrow = 0;
   xShrink = 0;
   //xPos = 1259;
   xPos = newxPos;
   yPos = 0;
   //xLen = 600;
   xLen = newxLen;
   yLen = 0;
   yGrow = 3;
   yShrink = 0;
   goodToGo = 0;
   ceilingTime = 1;  
 }
 

 
 if (yLen >= 539 && ceilingTime == 1)
 {
  yShrink = 3;
  yGrow = -3;
 } 
 
 if (ceilingTime == 1 && (yLen <= 0 && yPos > 0)) //when the ceiling water finishes
 {
   yGrow = 3;
   yShrink = 0;
   yLen = 107;
   yPos = 800;
   xPos = 0;
   xLen = 0;
   xShrink = 0;
   ceilingTime = 0;
   goodToGo = 2;
   println("reached");
 }
 
  if (goodToGo == 1)   //xPos = xPos + xShrink;
 {  
   xLen = xLen + xGrow;
   xPos = xPos + xShrink;
 }
 
 if (ceilingTime == 1)
 {
   yLen = yLen + yGrow;
   yPos = yPos + yShrink;
 }
 
}

void streamGenerator()
{
  newxLen = int(random(20, 100));
  newxPos = int(random(1259, 1600-newxLen));
  println(newxLen);
  println(newxPos);
}


void draw(){
  background(204);
  drawPipeline();

  
}
