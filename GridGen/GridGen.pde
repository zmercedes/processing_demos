void setup(){
  size(2000,2000);
  strokeWeight(4);
}

void draw(){
  background(180);
  for(int i = 0; i<width;i+=100) line(i,0,i,height);
  for(int i = 0; i<width;i+=100) line(0,i,width,i);
  if(mousePressed) save("C:\\Directory");
}
