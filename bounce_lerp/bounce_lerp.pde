float x = 250;
float y = 250;
float start = 0;
float end = 0;
float shapeX = 50;
float shapeY = 50;
float startX = 50;
float endX = 20;
float startY = 50;
float endY = 80;
float stretch = 30;
float speedX = 5;
float speedY = 8;

boolean bouncing = false;
boolean side = true;
float bounceFrame = 0;
float totalFrames = 8;
void setup(){
  //frameRate(15);
  size(500,500);
}

void draw(){
  background(220);
  ellipse(x,y,shapeX,shapeY);
  
  y += speedY;
  x += speedX;
  if((x-25 <= 0 || x+25 >= width) && !bouncing ){
    bouncing = true;
    side = true;
    speedX *= -1;
    bounceFrame = frameCount + totalFrames;
    start = x;
    endX = startX - stretch;
    endY = startY + stretch;
    if(speedX > 0)
      end = x-15;
    else
      end = x + 15;
    
  }
  if((y-25 <= 0 || y+25 >= height) && !bouncing ){
    bouncing = true;
    side = false;
    speedY *= -1;
    bounceFrame = frameCount + totalFrames;
    start = y;
    endX = startX + stretch;
    endY = startY - stretch;
    if(speedY > 0)
      end = y-(stretch/2);
     else
      end = y + (stretch/2);
  }
  if(bouncing){
    float frame = totalFrames + (frameCount - bounceFrame);
    float half = totalFrames/2;
    float currentStep;
    if(frame > 0 && frame <= half){
      currentStep = frame/half;
      shapeX = lerp(startX, endX, currentStep);
      shapeY = lerp(startY, endY, currentStep);
      if(side)
        x = lerp(start, end, currentStep);
      else
        y = lerp(start, end, currentStep);
    } else if(frame > half && frame <= totalFrames){
      currentStep = (frame-half)/half;
      shapeX = lerp(endX, startX,currentStep);
      shapeY = lerp(endY, startY, currentStep);
      if(side)
        x = lerp(end, start, currentStep);
      else
        y = lerp(end, start, currentStep);
    } else if(frame > totalFrames)
      bouncing = false;
  }
}
