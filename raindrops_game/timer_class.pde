//creates a class that will add raindrops as time progresses
class Timer {
  /* time is the current time
  ot is the old time: the time at which the last raindrop was dropped
  */
  int time, ot;
  //creates a constructor with no parameters
  Timer() {
    ot=0;
  }
  //sets time equal to the number of milliseconds that the game has been running and prints this time
  void run() {
    time=millis();
//    println(millis());
  }
  //adds a raindrop every 3 seconds
  void addDrops() {
    /*if the difference between the time and the time since the last raindrop was dropped is greater than 3, the number of raindrops increases
    old time is set to equal time because this way the difference between the two will equal zero and will against increase until 3 seconds
    */
    if (time-ot>3000) {
      ot=time;
      //another raindrop is added only if the index is less than the length of the array of raindrops (which is the maximum number of raindrops)
      if (n<raindrop.length) {
        n++;
      }
    }
  }
}

