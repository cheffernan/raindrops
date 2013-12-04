Raindrop[] raindrop;
Catcher c;
int p,q;
void setup() {
  size(800, 800);
  noStroke();
  textAlign(CENTER);
  colorMode(HSB,360,100,100);
  c=new Catcher(180);
  raindrop=new Raindrop[10];
  p=0;
  q=0;
  for (int i=0;i<raindrop.length;i++) {
    raindrop[i]=new Raindrop();
  }
}
void draw() {
  background(0);
  c.display();
  for (int i=0;i<raindrop.length;i++) {
    raindrop[i].display();
    raindrop[i].stopGame();
    raindrop[i].move();
    raindrop[i].checkCatcher(c);
    
  }
  textSize(50);
  text(p,width/2,50);
  textSize(20);
  text(q,width-20,20);
}

