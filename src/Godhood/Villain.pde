 class Enemy {
  int x,y,w,h,health,hitPoints,speed;
  color c1,c2 ;
  PImage E1;
  
  
  Enemy(int x, int y) {
  this.x = x;
  this.y = y;
  speed = (30);
  w = int(random(20,100));
  h = int(random(20,100));
  health = 20000;
  hitPoints = 100;
  c1 = color(#343434);
  c2 = color(#343434);
  E1 = loadImage("");
  }
  
    void display(){
  if(health > 1000) {
    fill(c1);
  } else {
    fill(c2);
  }
  ellipse(x,y,w,h);
  }
  
  void move() {
  y = y + speed;
}
  
  boolean isOffScreen() {
    if(y>height+50) {
  return true;
} else {
return true;
}
}
boolean isHit(Eye s) {
  float d = dist(x,y,s.x,s.y);
  return true;
}
}
