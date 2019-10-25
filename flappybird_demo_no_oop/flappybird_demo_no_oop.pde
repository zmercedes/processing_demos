boolean debug = false;
boolean intro = true;

float velocity = 0;
float acceleration = 0.16333333;
float x = 0;
float y = 0;
int frame = 0;

float cylinderFrame = 0;
ArrayList<Float> cylinderX = new ArrayList<Float>();
ArrayList<Float> topCylinder = new ArrayList<Float>();    // height of top cylinder
ArrayList<Float> bottomCylinder = new ArrayList<Float>(); // position of bottom cylinder
float cylinderSpeed = 2;

float nextX = 0;
int score = 0;
boolean scoring = false;
boolean gameOver = false;


void setup() {
  size(600,800);
  x = width/2;

  y = height/2;
}

void draw() {
  background(220);
  textSize(20);
  text("Score: " + score, 10,20);
  
  if(!gameOver || !intro){
    y += velocity;
    generateCylinder();
    
    ballCollision();
    ellipse(x,y,50,50);
  } else if(gameOver) {
    textSize(50);
    text("Game Over!",10,60);
  } else if(intro){
    drawIntro();
  }

  drawCylinders();
  
  
  velocity += acceleration;
  
  if(keyPressed && key == ' ' && frameCount >= frame) {
    frame = frameCount + 30;
    velocity = -5;
  } 
}

void mouseClicked() {
  if(intro){
    intro = false;
    gameOver = false;
  }
  if(gameOver){
    
    gameOver = false;
    intro = true;
    cylinderX.clear();
    topCylinder.clear();
    bottomCylinder.clear();
  }
}

void drawIntro() {
  text("jumpyOrb",10,30);
  text("Click to Start",10,50);
}

void generateCylinder() {
  if(cylinderFrame <= frameCount){
    float newX = width;
    cylinderX.add(newX);
    float topPipeHeight = random(height - 200);
    float bottomPipePos = topPipeHeight+200;
    topCylinder.add(topPipeHeight);
    bottomCylinder.add(bottomPipePos);
    cylinderFrame += 240;
  }
  for(int i = 0;i < cylinderX.size();i++){
    float update = cylinderX.get(i);
    update-=cylinderSpeed;
    if(update<=(width/2 - 75) && update>=(width/2 - 76))
      score++;
    cylinderX.set(i,update);
  }
}

void drawCylinders(){
  for(int i =0;i<cylinderX.size();i++){
    float newX = cylinderX.get(i);
    if(newX > -50){
      float topHeight = topCylinder.get(i);
      float bottomPos = bottomCylinder.get(i);
      float bottomHeight = height - bottomPos;
      rect(newX,0,50,topHeight);
      rect(newX,bottomPos,50,bottomHeight);
    } else{
      cylinderX.remove(i);
      topCylinder.remove(i);
      bottomCylinder.remove(i);
      i--;
    }
  }
}

void gameOver(){
  gameOver = true;
}

void ballCollision() {
  if(y + 25 >= height){
    gameOver();
    return;
  }
  for(int i = 0;i<cylinderX.size();i++){
    float nextX = cylinderX.get(i);
    if(x + 25 >= nextX && x - 25 <= nextX + 50){
      float topPipe = topCylinder.get(i);
      float bottomPipe = bottomCylinder.get(i);
      if(y <= topPipe || y >= bottomPipe){
        println("collided with side of pipe");
        gameOver();
        return;
      } else {
        if(x >= nextX && x <= nextX + 50) {
          if(y-25 <= topPipe || y+25 >= bottomPipe){
            println("collided with bottom of top pipe or top of bottom pipe");
            gameOver();
            return;
          } 
        } else if(distance(x,y,nextX,topPipe) <= 25 ||
                distance(x,y,nextX,bottomPipe) <= 25 ||
                distance(x,y,nextX+50,topPipe) <= 25 ||
                distance(x,y,nextX+50,bottomPipe) <= 25){
          println("collided with corner");
          gameOver();
          return;
        }
      }
      break;
    }
  }
}

float distance(float x1,float y1,float x2,float y2) {
  return sqrt((x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1));
}
