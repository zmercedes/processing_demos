
final float gravity = 0.1666;
Player player;
void setup(){
  size(400,700);
  rectMode(CENTER);
  player = new Player();
}

void draw(){
  background(220);
  player.move();
  player.display();
  
}

void keyPressed(){
  player.setKey(key,true);
}

void keyReleased(){
  player.setKey(key,false);
}
