PVector s;
int r, t, ot;
color c;
void setup() {
  size(600, 600);
  noStroke();
  c=0;
  r=50;
  s=new PVector(width/2, height/2);

  ot=0;
}
void draw() {
  t=millis();
  println(millis());
  background(nc);
  if (t-ot>2000) {
    c=color(random(255), random(255), random(255));
    s=new PVector(random(nr, width-nr), random(nr, height-nr));
    ot=t;
  }
  fill(0, 255, 255);
  ellipse(s.x, s.y, 2*r, 2*r);
}

