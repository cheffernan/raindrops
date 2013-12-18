//creates boolean to run the game, raindrops, catcher, timer, start screen, and picture
boolean run;
Raindrop[] raindrop;
Catcher catching;
Timer t;
Start st;
PImage game;
Star[] star;
/* p is the number of raindrops you have caught
 q is the number of raindrops you have missed
 n is the index that determines how many raindrops will be on the screen
 ntwo is the index that determines how many stars will fall
 lim is how many raindrops can reach the bottom of the screen until the game stops
 */
int p, q, n, ntwo, lim;
void setup() {
  //sets up colormode, size, text, and stroke for game
  size(800, 800);
  noStroke();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  imageMode(CORNER);
  //initializes all parameters, integers, classes, array, and image
  catching=new Catcher();
  raindrop=new Raindrop[100];
  t=new Timer();
  st=new Start();
  game=loadImage("game scene.jpg");
  star=new Star[10];
  p=0;
  q=0;
  n=1;
  ntwo=0;
  lim=50;
  run=false;
  for (int i=0;i<raindrop.length;i++) {
    raindrop[i]=new Raindrop();
  }
  for (int i=0;i<star.length;i++) {
    star[i]=new Star();
  }
}
void draw() {
  //the main code only runs if the boolean run is true
  if (run) {
    /* diplays the image as a background
     displays the catcher and allows it to move
     starts the timer and increases the number of drops according to the time
     */
    imageMode(CORNER);
    image(game, 0, 0, width, height);
    catching.display();
    catching.move();
    t.run();
    t.addDrops();
    /* in a for loop, which runs until the index n is reached each draw loop:
     each raindtop is displayed
     raindrops move, but only if the game is not stopped
     game stops if lim is reached
     the program checks to see if the catcher touches the raindrop
     if it does, raindrop is reset to top
     */
    for (int i=0;i<n;i++) {
      raindrop[i].display();
      if (q<lim) {
        raindrop[i].move();
      }
      raindrop[i].stopGame();
      raindrop[i].checkCatcher(catching);
    }
    for (int i=0;i<ntwo;i++) {
      star[i].display();
      if (q<lim) {
        star[i].move();
      }
      star[i].checkCatcher(catching);
    }
    //displays the two scores, the number of raindrops caught in the middle of the screen in green, and the number of drops missed on the side of the screen in red
    fill(120, 100, 100);
    textSize(50);
    text(p, width/2, 50);
    fill(0, 50, 80);
    textSize(20);
    text(q, width-20, 20);
  }
  //if the boolean run is false, the start screen displays
  else {
    st.display();
  }
}
//a mouse press changes the game from start screen to running and game over to start screen
void mousePressed() {
  //the changeRun function starts the game
  st.changeRun();
  for (int i=0;i<n;i++) {
    raindrop[i].reset();
  }
}

