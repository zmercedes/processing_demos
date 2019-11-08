
final float gravity = 0.3;

Player player;

PlatformManager platforms;

void setup(){
  size(400,700);
  rectMode(CENTER);
  player = new Player();
  platforms = new PlatformManager(player);
}

void draw(){
  background(220);
  player.update();
  platforms.update();
}

void keyPressed(){
  player.setKey(key,true);
}

void keyReleased(){
  player.setKey(key,false);
}
