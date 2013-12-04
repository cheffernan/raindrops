Timer a;
color c;
void setup() {
  size(600, 600);
  noStroke();
  a=new Timer(2000);
}
void draw() {
  background(c);
  a.calcTime();
}
class Timer {
  int t, ot,st;
  color c;
  Timer(int settime) {
    st=settime;
    c=0;
    ot=0;
  }
  void calcTime() {
    t=millis();
    println(millis());
    background(c);
    if (t-ot>2000) {
      c=color(random(255), random(255), random(255));
      ot=t;
    }
  }
}

