//this class will have a catcher that moves along the bottom of the screen according to the movement of the mouse
class Catcher {
  //creates a position (s) for the catcher, as well as a hue that will be a parameter, a radius, and a color for the fill
  PVector s;
  float r, h;
  color c;
  /* creates a parameter (o) that will be the hue of the fill
  initializes the radius and position of the catcher
  */
  //creates a contructor with one float parameter that will equal the hue of the fill
  Catcher() {
    r=50;
    s= new PVector(mouseX, height-r);
  }
  //shows the catcher, ellipse with a fill of predetermined color and radius
  void display() {
    colorMode(HSB, 360, 100, 100);
    c= color(360*q/lim, 80, 100);
    fill(c);
    ellipse(s.x, s.y, 2*r, 2*r);
  }
  //makes the catcher follow the mouse across the bottom of the screen
  void move() {
    s.x=mouseX;
  }
}

