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
    if(player.y <= height/2 && !player.isFalling){
      move(-player.speedY);
    }
    generatePlatform();
    for(int i = 0;i<platforms.size();i++){
      Platform platform = platforms.get(i);
      
      if(platform.y >= height + platform.tall){
        platforms.remove(i);
        continue;
      }
      platform.display();
    }
    for(Platform platform : platforms){
      if(platform.collider(player)) break;
    }
  }
  
  void generatePlatform(){
    Platform top = platforms.get(platforms.size()-1);
    if(top.y > 50){
      float xPos = random(35,width-35);
      float y = random(60,70);
      platforms.add(new Platform(xPos,top.y-y));
    }
  }
  
  void move(float speed){
    for(Platform platform: platforms){
      platform.move(speed);
    }
  }
}
