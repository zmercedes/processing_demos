class Platform {
  float x;
  float y;
  float wide = 60;
  float tall = 20;
  float top;
  float left;
  float right;
  boolean colliding = false;
  
  Platform(float _x, float _y){
    x = _x;
    y = _y;
    top = y - tall/2;
    left = x - wide/2;
    right = x + wide/2;
  }
  
  void display(){
    rect(x,y, wide,tall);
  }
  
  void move(float speed) {
    y += speed;
    top = y - tall/2;
  }
  
  boolean collider(Player player){
    if(player.bottom >= top && player.top < y - player.tall &&
       player.left <= right && player.right >= left &&
       player.isFalling){
      colliding = true;
      player.ground = top - player.tall/2;
      return true;
    } else if(player.left > right || player.right < left 
           || player.y < top - player.tall/2) {
      colliding = false;
      player.ground = height - player.tall/2;
      return false;
    }
    
    return colliding;
  }
}
