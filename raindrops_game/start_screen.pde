class Start {
PVector s;
  Start() {
    s=new PVector(width/2,height/2);
  }
  void display() {
    fill(120, 100, 100);
    rect(s.x,s.y, l, w);
    fill(0, 0, 100);
    textSize(75);
    text("START", width/2, height/2);
  }
  void changeRun() {
    if (mouseX<(width+l)/2&&mouseX>(width-l)/2&&mouseY<(height+w)/2&&mouseY>(height-w)/2) {
      run=!run;
    }
  }
}

