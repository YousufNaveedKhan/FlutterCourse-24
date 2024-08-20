void main() {
  String fname = "Yousuf";
  String lname = "Naveed";
  String email = "yousuf@gmail.com";
  String password = "yousufkhan";
  
  String loginEmail = "yousuf@gmail.com";
  String loginPassword = "yousufkhan";

  if (email == loginEmail && password == loginPassword) {
    print("Welcome to our website ${fname} ${lname}");

    double eng = 97;
        print("English: ${eng}");
    double urdu = 99;
        print("Urdu: ${urdu}");
    double math = 73;
        print("Maths: ${math}");
    double science = 43;
        print("Science: ${science}");
    double islamiyat = 100;
        print("Islamiyat: ${islamiyat}");
    double chemistry = 63;
        print("Chemistry: ${chemistry}");
    double ps = 100;
        print("Pakistan Studies: ${ps}");

    double obtainedMarks =
        eng + urdu + math + science + islamiyat + chemistry + ps;
        print("Obtained Marks: ${obtainedMarks} / 700");
    double per = (obtainedMarks / 700) * 100;
        print("Percentage: ${per.toStringAsFixed(2)}");
    
    if (per <= 100 && per >= 80) {
      print("Grade: A+");
      print("Remarks: Excellent");
    }else if (per <= 79 && per >= 70) {
      print("Grade: A");
      print("Remarks: Very Good");
    }else if (per <= 69 && per >= 60) {
      print("Grade: B");
      print("Remarks: Good");
    }else if (per <= 59 && per >= 50) {
      print("Grade: C");
        print("Remarks: Satisfactory");
    }else if (per <= 49 && per >= 40) {
      print("Grade: D"); 
      print("Remarks: Average");
    }else {
      print("FAILED");
      print("Remarks: Needs Improvement");
    }
  } else {
    print("Invalid email or password!");
  }
}
