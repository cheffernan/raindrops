//this class will have a catcher that moves along the bottom of the screen according to the movement of the mouse
class Catcher {
  //creates a position (s) for the catcher and a color for the fill
  PVector s;
  float r;
  color c;
  /* initializes the radius and position of the catcher
   creates a contructor with no parameters
   */
  Catcher() {
    r=75; 
  }
  //shows the catcher, ellipse with a fill of predetermined color and radius
  void display() {
    colorMode(HSB, 360, 100, 100);
    /* the color of the catcher changes as you miss more raindrops
     the color starts at red, then goes through the entire spectrum back to red 
     */
    s= new PVector(mouseX, height-r);
    c= color(360*q/lim, 80, 100);
    fill(c);
    ellipse(s.x, s.y, 2*r, 2*r);
  }
  //makes the catcher follow the mouse across the bottom of the screen
  void move() {
    s.x=mouseX;
  }
}

