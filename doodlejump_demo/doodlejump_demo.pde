
final float gravity = 0.166666;

Player player;

ArrayList<Platform> platforms = new ArrayList<Platform>();

void setup(){
  size(400,700);
  rectMode(CENTER);
  player = new Player();
  platforms.add(new Platform(120,height-60));
  platforms.add(new Platform(240,height-80));
  platforms.add(new Platform(120,height-140));
  platforms.add(new Platform(240,height-240));
}

void draw(){
  background(220);
  player.move();
  player.display();
  platformsDisplay();
  platformsCollision();
}

void platformsDisplay(){
  for(Platform platform : platforms){
    platform.display();
  }
}

void platformsCollision(){
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
