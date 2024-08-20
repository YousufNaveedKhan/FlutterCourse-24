void main() {
  String fname = "Yousuf";
  String lname = "Naveed";
  String email = "yousuf@gmail.com";
  String password = "yousufkhan";

  String loginEmail = "yousuf@gmail.com";
  String loginPassword = "yousufkhan";
  
  if (email == loginEmail && password == loginPassword) {
   print("Welcome to our website ${fname} ${lname}");
    
    int birthYear = 2003;
    int currentYear = 2024;
    int count = 0;
    
    for (int i = birthYear; i <= currentYear; i++) {
      if (i % 4==0) {
        count++;
        print("${i} is a leap year");
}else {
        print("${i} isn't a leap year");
      }
    }
    print("Total leap year count since your birth year: ${count}");
    int age = currentYear - birthYear;
    print("Your age is ${age}");
    
    
  }else {
    print("Invalid email or password!");
  }
}
