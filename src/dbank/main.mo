import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  currentValue := 300;
  
  stable var startTime = Time.now();
  startTime := Time.now();
  
  public func topUp(amount: Float) {
    currentValue += amount;
  };

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if (tempValue >= 0){
      currentValue -= amount;
    } else {
      Debug.print("The amount you're trying to withdraw is greater than the current value you possess.");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    var currentTime = Time.now();
    var timeElapsedNS = currentTime - startTime;
    var timeElapsedS = timeElapsedNS / 1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  }

}