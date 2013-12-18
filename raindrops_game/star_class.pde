//this class will have stars that fall from the sky for bonuses
class Star {
  //creates a position (s) for the star, a velocity (v), a size (l), and an image
  PVector s, v;
  int l;
  PImage bonus;
  //creates a contructor with no parameters
  Star() {
    //initializes all variables
    l=10;
    s= new PVector(random(l, width-l), -2*l);
    v=new PVector(random(-5, 5), random(2, 5));
    bonus=loadImage("star.png");
  }
  //shows the star, an image of predetermined size
  void display() {
    imageMode(CENTER);
    image(bonus, s.x, s.y, 2*l, 2*l);
  }
  //makes the star fall down the screen
  void move() {
    s.add(v);
    if (s.x>width+l) {
      s.x=0;
    }
    if (s.x<-l) {
      s.x=width;
    }
  }
  void checkCatcher(Catcher z) {
    /*if the sum of the catcher radius and star size is greater than the distance between the center of the star and catcher, then the star goes below the screen and stops moving, and the number of misses decreases by 5
     */
    if (s.dist(z.s)<l+z.r) {
      s= new PVector(0, height+100);
      v=new PVector(0, 0);
      q-=5;
      if (q<0) {
        q=0;
      }
    }
  }
}

