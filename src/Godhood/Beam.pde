class Beam {

int x,y,w,h,speed;

Beam(int x, int y) {
this.x = x;
this.y = y;
w = 8;
h = 12;
speed = 5;
}
void display() {
  fill (0,0,256);
  rectMode(CENTER);
  rect(x,y,w,h);
}

void move() {
  
}
