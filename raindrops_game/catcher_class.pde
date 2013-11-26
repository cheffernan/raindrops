class Catcher {
  PVector s;
  float r;
  color c;
  Catcher() {
    r=50;
    s= new PVector(mouseX, height-r);
  }
  void display() {
    colorMode(HSB, 360, 100, 100);
    c= color(180, 0, 80);
    fill(c);
    s.x=mouseX;
    ellipse(s.x, s.y, 2*r, 2*r);
  }
}

