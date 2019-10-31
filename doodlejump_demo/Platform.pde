class Platform {
  float x;
  float y;
  
  Platform(float _x, float _y){
    x = _x;
    y = _y;
  }
  
  void display(){
    rect(x,y, 60,20);
    //rect(x,y-10,60,1); 
  }
  
  void collider(Player player){
    if(player.bottom + 10 >= y && player.y <= y + 10 &&
       player.x-15 <= x + 30 && player.x + 15 >= x - 30){
      player.ground = y - 35;
    } else 
      player.ground = height - 25;
  }
}
