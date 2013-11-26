class Catcher {
  PVector s;
  float r;
  color c;
  Catcher(float x, float y) {
    r=50;
    s= new PVector(x, y);
  }
  void display() {
    colorMode(HSB, 360, 100, 100);
    c= color(180, 0, 80);
    fill(c);
    ellipse(s.x, s.y, 2*r, 2*r);
  }
}

