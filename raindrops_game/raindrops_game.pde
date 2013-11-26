Raindrop[] raindrop;
Catcher c;
void setup() {
  size(800, 800);
  noStroke();
  c=new Catcher(width/2,height-50);
  raindrop=new Raindrop[100];
  for (int i=0;i<raindrop.length;i++) {
    raindrop[i]=new Raindrop();
  }
}
void draw() {
  background(0);
  c.display();
  for (int i=0;i<raindrop.length;i++) {
    raindrop[i].display();
    raindrop[i].move();
  }
}

