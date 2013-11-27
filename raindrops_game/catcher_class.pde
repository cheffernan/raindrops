class Catcher {
  PVector s;
  float r,h;
  color c;
  Catcher(float o) {
    r=50;
    h=o;
    s= new PVector(mouseX, height-r);
  }
  void display() {
    colorMode(HSB, 360, 100, 100);
    c= color(h, 50, 80);
    fill(c);
    s.x=mouseX;
    ellipse(s.x, s.y, 2*r, 2*r);
  }
}

