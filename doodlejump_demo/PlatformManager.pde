class PlatformManager {
  
  ArrayList<Platform> platforms;
  Player player;
  
  PlatformManager(Player player){
    this.player = player;
    this.platforms = new ArrayList<Platform>();
    float currentY = height;
    while(currentY > 0){
      float xPos = random(35,width-35);
      float y = random(60,70);
      currentY = currentY - y;
      this.platforms.add(new Platform(xPos,currentY));
    }
  }
  
  void update() {
    for(Platform platform : platforms){
      platform.display();
    }
    for(Platform platform : platforms){
      if(platform.collider(player)) break;
    }
  }
}
