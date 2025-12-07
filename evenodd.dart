void main() {
  String fname = "Yousuf";
  String lname = "Naveed";
  String email = "yousuf@gmail.com";
  String password = "yousufkhan";
  
  String loginEmail = "yousuf@gmail.com";
  String loginPassword = "yousufkhan";

  if (email == loginEmail && password == loginPassword) {
    print("Welcome to our website ${fname} ${lname}");
    
    int num = 67;
    
    if (num % 2 == 0) {
      print("${num} is even number");
    }else {
      print("${num} is odd number");
    }
    
    
  } else {
    print("Invalid email or password!");
  }
}
