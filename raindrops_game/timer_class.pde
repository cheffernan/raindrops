//creates a class that will add raindrops as time progresses
class Timer {
  /* time is the current time
   ot is the old time: the time at which the last raindrop was dropped
   ost is the time at which the last star was dropped
   */
  int time, ot, ost;
  //creates a constructor with no parameters
  Timer() {
    ot=0;
    ost=0;
  }
  //sets time equal to the number of milliseconds that the game has been running and prints this time
  void run() {
    time=millis();
    println(millis());
  }
  //adds a raindrop every 2 seconds
  void addDrops() {
    /* if the difference between the time and the time since the last raindrop was dropped is greater than 2 seconds, the number of raindrops increases
     old time is set to equal time because this way the difference between the two will equal zero and will against increase until 2 seconds
     */
    if (time-ot>2000) {
      ot=time;
      //another raindrop is added only if the index is less than the length of the array of raindrops (which is the maximum number of raindrops)
      if (n<raindrop.length) {
        n++;
      }
    }
    /* if the difference between the time and the time since the last star was dropped is greater than 10 seconds, a new star is dropped
     old star time is set to equal time because this way the difference between the two will equal zero and will against increase until 10 seconds
     */
    if (time-ost>10000) {
      ost=time;
      //another star is added only if the index is less than the length of the array of raindrops (which is the maximum number of raindrops)
      if (ntwo<star.length) {
        ntwo++;
      }
    }
  }
}

