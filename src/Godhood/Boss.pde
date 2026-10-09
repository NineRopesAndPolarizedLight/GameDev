class Boss {
  int x,y,w,h, health;
  boolean isHit;
  PImage s1;
  
  Boss(int x, int y, int lvl) {
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    w = 500;
    h = 250;
    duration = 30000;
    health = 9000000;
  isHit = false;
  s1 = loadImage ("");
}
