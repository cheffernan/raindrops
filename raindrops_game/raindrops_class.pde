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
    v= new PVector(random(-.5, .5), random(0, 2));
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
    //if the raindrop hits the bottom of the screen, it is sent back to the top and the number of balls missed (q) increases
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
      s.x=height;
    }
  }
  //checks if the catcher and raindrop are touching
  void checkCatcher(Catcher z) {
    /*if the sum of their radii is greater than the distance between the center of the raindrop and catcher, then the velocity is reset and the position is reset to the top of the screen
     the velocity is reset because there is acceleration, and that would make the raindrops go too fast over time if not reset
     the number of raindrops caught increases. Also, the position is reset to just above the top of the screen
     */
    if (s.dist(z.s)<r+z.r) {
      v= new PVector(random(-1, 1), random(0, 3));
      s= new PVector(random(r, width-r), -r);
      // the score increases when the raindrop touches the catcher
      p++;
    }
  }
  //stops the game if over 100 raindrops are missed
  void stopGame() {   
    //creates a white background with a message if q (the number of raindrops missed) reaches lim (the limit of raindrops that can be missed)
    if (q>=lim) {
      background(0);
      textSize(75);
      fill(random(360),100,100);
      text("YOU LOSE. TRY AGAIN", width/2, height/2);
    }
  }
}

