class Eye{
  //member variable
  float x, y;
  PImage e;

  
  //constructor
  Eye(){
    x = width/2;
    y = height/2;
    e = loadImage("Eye.jpeg");
  }
  
  //member methods
  void display() {
    imageMode(CENTER);
    image(e,x,y,100,100);
  }
  
  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY; 
  }
}
