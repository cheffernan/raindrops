//this class will have a raindrop that falls down the screen, reappears at the top if the raindrop touches the catcher, and stops the game if too many raindrps are missed
class Raindrop {
  /* creates the position (s), velocity (v), and acceleration (a) vectors for the raindrop
   creates a radius and color for each raindrop
   */
  PVector s, v, a;
  float r;
  color c;
  //creates a constructor with no parameters
  Raindrop() {
    /* gives a radius to the drop, and an acceleration
     allows the position to have a random x-component
     velocity has random x and y components
     */
    r=5;
    s= new PVector(random(r, width-r), 0);
    v= new PVector(random(-.5, .5), random(0, 3));
    a= new PVector(0, .01);
  }
  //displays a drop according to the parameters defined above
  void display() {
    colorMode(HSB, 360, 100, 100);
    c= color(180, 0, 80);
    fill(c);
    ellipse(s.x, s.y, 2*r, 2*r);
  }
  //makes the raindrop move with velocity and acceleration
  void move() {
    s.add(v);
    v.add(a);
    /* if the raindrop hits the bottom of the screen, it is sent back to the top and the number of balls missed (q) increases
     the velocity is reset because there is acceleration, and that would make the raindrops go too fast over time if not reset
     */
    if (s.y>height-r) {
      v= new PVector(random(-1, 1), random(0, 3));
      s= new PVector(random(r, width-r), -r);
      q++;
    }
    //if the raindrop goes off the screen on the left or right side, it comes back in on the opposite side
    if (s.x>width+r) {
      s.x=0;
    }
    if (s.x<-r) {
      s.x=width;
    }
  }
  //checks if the catcher and raindrop are touching
  void checkCatcher(Catcher z) {
    /*if the sum of their radii is greater than the distance between the center of the raindrop and catcher, then the velocity is reset and the position is reset to the top of the screen
     the velocity is reset because there is acceleration, and that would make the raindrops go too fast over time if not reset
     the number of raindrops caught increases. Also, the position is reset to just above the top of the screen
     the score increases
     */
    if (s.dist(z.s)<r+z.r) {
      v= new PVector(random(-1, 1), random(0, 3));
      s= new PVector(random(r, width-r), -r);
      p++;
      //the radius of the catcher decreases every time the score increases to make the game harder 
      if (catching.r>10) {
        catching.r--;
      }
    }
  }
  //stops the game if over 100 raindrops are missed
  void stopGame() {   
    //creates a black background with a message if q (the number of raindrops missed) reaches lim (the limit of raindrops that can be missed)
    if (q>=lim) {
      background(0);
      textSize(75);
      fill(random(360), 100, 100);
      text("YOU LOSE. TRY AGAIN", width/2, height/2);
      //creates a button to try again, whose length and width are related to the start screen length and width 
      fill(0, 50, 80);
      rect(width/2, height-100, st.l, .75*st.w);
      textSize(50);
      fill(0);
      text("TRY AGAIN", width/2, height-100);
    }
  }
  //resets the parameters of the game so that it can be replayed
  void reset() {
    //checks if the mouse is clicked in the try again box
    if (mouseX<(width+st.l)/2&&mouseX>(width-st.l)/2&&mouseY>height-100-((.75*st.w)/2)&&mouseY<height-100+((.75*st.w)/2)) {
      /* boolean changes back to the start screen
       score and number miss reset to zero
       catcher radius is reset
       index n is brought back to 1
       raindrops are re-initialized
       */
      run=false;
      q=0;
      p=0;
      catching.r=75;
      n=1;
      for (int i=0;i<raindrop.length;i++) {
        raindrop[i]=new Raindrop();
      }
    }
  }
}

