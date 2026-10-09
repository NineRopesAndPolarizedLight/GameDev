class Power { 
  int x, y, w, h, size; 
  float speed;  
  color c1; 
  PImage p1; 

  Power(int x, int y) { 
    this.x = x; 
    this.y = y; 
    this.w = w; 
    this.h = h; 
    this.size = 40; 
    this.speed = random(5, 10);
    this.c1 = color(#343434); 
    this.p1 = loadImage("Power.gif"); 
  } 

  void display() { 
    if (size > 50) { 
      fill(c1); 
    } else { 
      fill(0, 0, 0); 
    } 
    ellipse(x, y, w, h); 
  } 

  void move() { 
    y += speed; 
  } 

  boolean isOffScreen() { 
    
    return y > height + 50; 
  } 
}
