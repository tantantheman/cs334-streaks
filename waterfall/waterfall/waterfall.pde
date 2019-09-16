int xLen = 0;
int xGrow = 3;
int goodToGo = 0;

int xPos = 0;
int xShrink = 0;

int savedTime;
float totalTime;

void setup() {
  // setup processing interface
  fullScreen();
  stroke(255);
  
 // savedTime = millis();

}

void draw(){
  background(204);
 // totalTime = random(10000, 20000);

  
  rect(xPos, 800, xLen, 107);
 
  //xLen = 1;
  //xGrow = 1;
 
 if (xLen >= 1130)
 {
  goodToGo = 0;
  xShrink = 3;
  xGrow = -3;
 }
   
 if (xLen <= 0 && xPos > 0)
 {
   xGrow = 0;
   xShrink = 0;
   xLen = 0;
   xPos = 0;
   goodToGo = 1;
 }
 
 if (goodToGo == 1 && (second() % 7 == 3)) //modulo gets us a more "random" time
 {
   //xLen = 0;
   xGrow = 3;
 }
 
    //xPos = xPos + xShrink;
   xLen = xLen + xGrow;
   xPos = xPos + xShrink;
}

void pipeline()
{
}
