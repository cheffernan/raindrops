//creates a class for the start screen
class Start {
  // creates a position for the start button and a length and width for the rectangle
  PVector s;
  float l, w;
  //creates a constructor with no parameters
  Start() {
    //initializes all variables
    s=new PVector(width/2, height/2);
    l=300;
    w=100;
  }
  //displays the start button, a rectangle with the word start in it
  void display() {
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

