class Player {
  
  private float x;
  private float y;
  private float ground = 0;
  
  private float speedX;
  private float speedY;
  private float jumpSpeed;
  
  private float wide = 30;
  private float tall = 50;
  
  // player movement state
  private boolean jumping;
  private boolean forward;
  private boolean backward;
  
  Player() {
    this.x = width/2;
    this.y = height/2;
    this.speedX = 4;
    this.speedY = 0;
    this.jumping = false;
    this.forward = false;
    this.backward = false;
    this.jumpSpeed = -5;
    this.ground = height-25;
  }
  
  public void move(){
    y += speedY;
  
    if(y + 25 >= height){
      jumping = false;
      y = ground;
    } else
      speedY += gravity;
      
    if(x < -wide/2)
      x = width + wide/2;
      
    if(x > width + wide/2)
      x = -wide/2;
      
    if(this.forward)
      x += speedX;
    
    if(this.backward)
      x -= speedX;
      
    if(keyPressed && key == ' ' && !jumping){
      jumping = true;
      speedY = jumpSpeed;
    }
  }
  
  
  public void display(){
    rect(x,y,wide,tall);
  }
  
  public void setKey(char k, boolean b){
    switch(k){
      case 'a':
        this.backward = b;
        break;
      case 'A':
        this.backward = b;
        break;
      case 'D':
        this.forward = b;
        break;
      case 'd':
        this.forward = b;
        break;
    }
  }
}
