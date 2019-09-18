class Timer
{
   private int timeToMove = 500;
   // the previous time
   private int savedTime = 0;
   public Timer()
   {
     // set the timer the first time
     savedTime = millis();
   }
   boolean timer()
   {
      // find out how much time has passed
      int passedTime = millis() - savedTime;
      // check to see if it's beyond our time to move variable
      if(passedTime > timeToMove)
      {
         // get the new time
         savedTime = millis();
         return true;
      }
      else
      {
        return false;
      }
   }
}
