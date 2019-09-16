int xLen = 1;
int xGrow = 1;

int xPos = 0;
int xShrink = 0;
boolean stopGrow = false;

void setup() {
  // setup processing interface
  fullScreen();
  //output = createWriter("mapping_info.txt"); 
  
  stroke(255);

}

void draw(){
  background(204);
 
  rect(xPos, 800, xLen, 107);
 
 if (xLen == 1130)
 {
  //xLen = xLen + xGrow;
  //xPos = xPos + xShrink;
  xShrink = 1;
  xGrow = -1;
  //stopGrow = true;
 }
 
   //xPos = xPos + xShrink;
   xLen = xLen + xGrow;
   xPos = xPos + xShrink;
   
 if (xLen == 0 && xPos > 0)
 {
   xGrow = 0;
   xShrink = 0;
 }
 
 
  
}
