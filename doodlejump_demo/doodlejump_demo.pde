
final float gravity = 0.166666;

Player player;
Platform platform;

void setup(){
  size(400,700);
  rectMode(CENTER);
  player = new Player();
  platform = new Platform(120,height-60);
}

void draw(){
  background(220);
  player.move();
  player.display();
  platform.display();
  platform.collider(player);
}

void keyPressed(){
  player.setKey(key,true);
}

void keyReleased(){
  player.setKey(key,false);
}
