//creates a class for the start screen
class Start {
  // creates a position for the start button, an image for the background, and a length and width for the rectangle
  PVector s;
  PImage first;
  float l, w;
  //creates a constructor with no parameters
  Start() {
    //initializes all variables
    s=new PVector(width/2, height/2);
    first=loadImage("start scene.JPG");
    l=300;
    w=100;
  }
  //displays the image and the start button, a rectangle with the word start in it
  void display() {
    imageMode(CORNER);
    image(first, 0, 0, width, height);
    fill(120, 100, 100);
    rect(s.x, s.y, l, w);
    fill(0, 0, 100);
    textSize(75);
    text("START", width/2, height/2);
  }
  //runs the game
  void changeRun() {
    //if the mouse is within the rectangle, the run boolean changes to true
    if (mouseX<(width+l)/2&&mouseX>(width-l)/2&&mouseY<(height+w)/2&&mouseY>(height-w)/2) {
      run=!run;
    }
  }
}

