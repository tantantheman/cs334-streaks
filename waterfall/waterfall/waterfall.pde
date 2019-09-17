int xLen = 0;
int xGrow = 3;
int goodToGo = 1;
int ceilingTime = 2;
int newxLen;
int newxPos;
int xPos = 0;
int xShrink = 0;

int secondxPos = 1259;
int secondxLen = 661;
int secondyPos = 1286;
int secondyLen = 1080;
int secondyGrow = 0;
int startFade = 0;

int globalColorR = int(random(0, 255));
int globalColorG = int(random(0, 255));
int globalColorB = int(random(0, 255));

int yLen = 200;
int yGrow = 3;
int yPos = 800;
int yShrink = 0;

int yHalf = 643;

//for particles!
int count = 0;
int uhOh = 0;
int removeParticles = 0;
ArrayList<ParticleSystem> systems;

void setup() {
  // setup processing interface
  fullScreen();
  noStroke();  
  //frameRate(20);
  systems = new ArrayList<ParticleSystem>();

}

void draw(){
  background(0);
  drawPipeline(); 
 /* for (ParticleSystem ps : systems) {
    ps.run();
    ps.addParticle();
    } */
    
   for (int i = systems.size()-1; i >= 0; i--) {
    ParticleSystem ps = (ParticleSystem) systems.get(i);
    ps.run();
    ps.addParticle();

    if (uhOh == 1) {
      systems.remove(i);
    }

  }

}

void colorChange(){
  
  globalColorR = int(random(0, 255));
  globalColorG = int(random(0, 255));
  globalColorB = int(random(0, 255));
  
}
void drawPipeline()
{
 fill (globalColorR, globalColorG, globalColorB);
 rect(xPos, yPos, xLen, yLen);
 rect(secondxPos, secondyPos, secondxLen, secondxPos);

 if (goodToGo == 2 && (second() % 7 == 3 && ceilingTime == 0)) //modulo gets us a more "random" time
 {
   uhOh = 0;
  // yLen = 200;
   colorChange();
   goodToGo = 1;
   xGrow = 3;
   //fill(globalColorR, globalColorG, globalColorB);
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
   xPos = newxPos;
   yPos = 0;
   xLen = newxLen;
   yLen = 0;
   yGrow = 3;
   yShrink = 0;
   goodToGo = 0;
   ceilingTime = 1;  
 }
 
 if (yLen >= yHalf && ceilingTime == 1)
 {
  yShrink = 3;
  yGrow = -3;
  goodToGo = 3;
 } 

 if (ceilingTime == 1 && (yLen <= 0 && yPos > 0) && secondyPos >= 1200) //when the ceiling water finishes
 {
   

   
   //secondyGrow = 3;
   yGrow = 0;
   yShrink = 0;

   xShrink = 0;
   ceilingTime = 0;
   removeParticles();
   goodToGo = 2; //time for the actual waterfall!
   
   
 }

 if (goodToGo == 3) //implementation of the particles for waterfall
 {
   
   if (count < 5)
   {
   systems.add(new ParticleSystem(1, new PVector((newxPos + 3 + ((newxLen/5) * count)) , yHalf)));
   count = count + 1;
   }
   
   if (secondyGrow == -3 && secondyPos <= yHalf)
   {
     yLen = 0;
     yPos = 800;
     xPos = 0;
     xLen = 0;
     uhOh = 1;
     secondyGrow = 3;
   }
   else if (secondyGrow < 0 && secondyPos <= yHalf)
   {
     secondyGrow = 0;
   }
   else if (secondyGrow == 0 && secondyPos > yHalf)
   {
     secondyGrow = -3;
   }
   else if (secondyGrow == 3 && secondyPos >= 1200)
   {
     secondyGrow = 0;
   }

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
 
   secondyPos = secondyPos + secondyGrow;
}

void streamGenerator()
{
  newxLen = int(((random(40, 100))/2)*2);
  newxPos = int(random(1259, 1920-newxLen));
}


void removeParticles()
{

   //println(systems);
}

class ParticleSystem {

  ArrayList<Particle> particles;    // An arraylist for all the particles
  PVector origin;                   // An origin point for where particles are birthed

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList<Particle>();   // Initialize the arraylist
    origin = v.copy();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin));    // Add "num" amount of particles to the arraylist
    }
  }


  void run() {
    // Cycle through the ArrayList backwards, because we are deleting while iterating
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  void killOff() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.lifespan = 0;
    }
  }


  void addParticle() {
    Particle p;
    // Add either a Particle or CrazyParticle to the system
      p = new Particle(origin);

    particles.add(p);
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    return particles.isEmpty();
  }
}

// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //acceleration = new PVector(0, 0.05);
    acceleration = new PVector(0, 0.4);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 150.0;
  }

  void run() {
    update();
    display();
  }
  
  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    //stroke(255, lifespan);
    fill(globalColorR, globalColorG, globalColorB);
    ellipse(position.x, position.y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    return (lifespan < 0.0);
  }
}
