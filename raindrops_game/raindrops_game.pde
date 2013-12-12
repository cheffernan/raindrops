//creates raindrops, catcher, and timer
boolean run;
Raindrop[] raindrop;
Catcher c;
Timer t;
Start st;
/* p is the number of raindrops you have caught
 q is the number of raindrops you have missed
 n is the index that determines how many raindrops will be on the screen
 lim is how many raindrops can reach the bottom of the screen until the game stops
 l and w correspond to the length and width of the the start and try again rectangle, which is why they are not in the start class
 */
int p, q, n, lim,l,w;
void setup() {
  //sets up colormode, size, text, and stroke for game
  size(800, 800);
  noStroke();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  //initializes all parameters, integers, classes, and array
  c=new Catcher();
  raindrop=new Raindrop[10];
  t=new Timer();
  st=new Start();
  p=0;
  q=0;
  n=1;
  lim=50;
  run=false;
  l=300;
  w=100;
  for (int i=0;i<raindrop.length;i++) {
    raindrop[i]=new Raindrop();
  }
}
void draw() {
  /* displays the catcher and allows it to move
   starts the timer and increases the number of drops according to the time
   */
  background(0);
  if (run) {
    c.display();
    c.move();
    t.run();
    t.addDrops();
    /* displays the x value
     moves the raindrops, but only if the game is not stopped
     stops the game if 100 raindrops are missed
     checks to see if the catcher touches the raindrop
     if it does, raindrop is reset to top
     */
    for (int i=0;i<n;i++) {
      raindrop[i].display();
      if (q<lim) {
        raindrop[i].move();
      }
      raindrop[i].stopGame();
      raindrop[i].checkCatcher(c);
    }
    //displays the two scores, the number of raindrops caught in the middle of the screen in green, and the number of drops missed on the side of the screen in red
    fill(120, 100, 100);
    textSize(50);
    text(p, width/2, 50);
    fill(0, 50, 80);
    textSize(20);
    text(q, width-20, 20);
  }
  else {
    st.display();
  }
}
void mousePressed() {
  st.changeRun();
  if (mouseX<(width+l)/2&&mouseX>(width-l)/2&&mouseY>height-100-((.75*w)/2)&&mouseY<height-100+((.75*w)/2)) {
    run=false;
    q=0;
    p=0;
  }
}

