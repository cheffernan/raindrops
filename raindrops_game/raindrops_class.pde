class Raindrop {
  PVector s, v, a;
  float r;
  color c;
  Raindrop() {
    r=5;
    s= new PVector(random(r, width-r), random(r, height-r));
    v= new PVector(random(-1, 1), random(0, 3));
    a= new PVector(0, .01);
  }
  void display() {
    colorMode(HSB, 360, 100, 100);
    c= color(180, 0, 80);
    fill(c);
    ellipse(s.x, s.y, 2*r, 2*r);
  }
  void move() {
    s.add(v);
    v.add(a);
    if (s.y>height-r) {
      v= new PVector(random(-1, 1), random(0, 3));
      s= new PVector(random(r, width-r), -r);
      q++;
      println(q);
    }
    if (s.x>width+r) {
      s.x=0;
    }
    if (s.x<-r) {
      s.x=height;
    }
  }
  void checkCatcher(Catcher z) {
    if (s.dist(z.s)<r+z.r) {
      v= new PVector(random(-1, 1), random(0, 3));
      s= new PVector(random(r, width-r), -r);
      p++;
    }
  }
  void stopGame() {   
    if (q>100) {
      background(255);
      text("YOU LOSE. TRY AGAIN", width/2, height/2);
    }
  }
}

