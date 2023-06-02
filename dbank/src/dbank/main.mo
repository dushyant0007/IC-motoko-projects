import Debug "mo:base/Debug";
import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";
// TO call function in terminal - dfx canister call dbank topUp '("args")'
// In this language its not easy to convert Nat to Float 
  
actor {
   // stable turn the flexable variable to a consistence variable
   // if we rerun the program the value of variable don't reset to 300, variable holds its state 
   stable var currentValue:Float = 300; 
  //  currentValue := 100; // reasigning the values
   var hi = "HELLO";
   Debug.print(hi); // Take text input
   Debug.print(debug_show(currentValue)); // debug_show() to print number

   stable let startTime  = Time.now();
   Debug.print(debug_show(startTime));

  // var is a variable 
  // let is a constant 

//take arg amount which is type of Nat naturalNumber
  public func topUp(amount:Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };
  
  public func withdrawal(amount:Float){
    let temp:Float = currentValue-amount; 
    if(temp>=0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    }else{
      Debug.print(debug_show(temp));
      Debug.print("account does not have sufficent balance ");
    }
  };

 //read only operation
  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime  = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/100000000000 ;
    currentValue := currentValue*((1+0.00000001)**(Float.fromInt(timeElapsedS)));

  };
    
  };

