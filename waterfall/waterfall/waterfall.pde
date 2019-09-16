int xLen = 1;
int xGrow = 3;

int xPos = 0;
int xShrink = 0;

int savedTime;
int totalTime = 5000;

void setup() {
  // setup processing interface
  fullScreen();
  //stroke(255);
  
  savedTime = millis();

}

void draw(){
  background(204);
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime)
  {
    
  }
  rect(xPos, 800, xLen, 107);
  
  //xLen = 1;
  //xGrow = 1;
 
 if (xLen >= 1130)
 {
  //xLen = xLen + xGrow;
  //xPos = xPos + xShrink;
  xShrink = 3;
  xGrow = -3;
 }
 

   
 if (xLen <= 0 && xPos > 0)
 {
   xGrow = 0;
   xShrink = 0;
   xLen = 0;
 }
 
    //xPos = xPos + xShrink;
   xLen = xLen + xGrow;
   xPos = xPos + xShrink;
 
 
  
}

void pipeline()
{
}
