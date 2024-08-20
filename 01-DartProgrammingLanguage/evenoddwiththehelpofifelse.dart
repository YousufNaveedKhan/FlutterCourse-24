void main() {
  for (double i = 0; i <= 100; i++) {
    if (i == 22 || i == 24 || i == 26 || i == 28 || i == 30) {
      continue;
    } else if (i == 50) {
      break;
    }

    if (i % 2 == 0) {
      print("${i} is even number");
    } else {
      print("${i} is odd number");
    }
  }
}
