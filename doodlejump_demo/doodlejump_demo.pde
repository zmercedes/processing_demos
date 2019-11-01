
final float gravity = 0.166666;

Player player;

ArrayList<Platform> platforms = new ArrayList<Platform>();

void setup(){
  size(400,700);
  rectMode(CENTER);
  player = new Player();
  float currentY = height;
  for(int i = 0;i<10;i++){
    float xPos = random(35,width-35);
    float y = random(60,70);
    currentY = currentY - y;
    platforms.add(new Platform(xPos,currentY));
  }
}

void draw(){
  background(220);
  player.update();
  platformsUpdate();
}

void platformsUpdate(){
  for(Platform platform : platforms){
    platform.display();
  }
  for(Platform platform : platforms){
    if(platform.collider(player))
      break;
  }
}

void keyPressed(){
  player.setKey(key,true);
}

void keyReleased(){
  player.setKey(key,false);
}
