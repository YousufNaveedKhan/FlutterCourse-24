import "dart:io";

void main() {
  for (int i = 1; i <= 5; i++) {
    stdout.write("*");
    for (int j = 1; j <= 5; j++) {
      stdout.write("*");
    }
    print('');
  }
}
