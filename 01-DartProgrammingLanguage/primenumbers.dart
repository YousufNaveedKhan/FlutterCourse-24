void main() {

double number = 25;
bool isPrime = true;

if (number == 1) {
   print("1 is neither prime nor composite number.");
}else if (number > 1) {
    for (double i = 2; i < number; i++) {
        if (number % i == 0) {
            isPrime = false;
            break;
        }
    }

    if (isPrime) {
        print("${number} is a prime number");
    } else {
        print("${number} is a not prime number");
    }
}

else {
    print("${number} isn't a prime number");
}
  
}