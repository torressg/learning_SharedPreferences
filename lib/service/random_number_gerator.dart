import 'dart:math';

class RandomNumberGerator {
  static int generateRandomNumber(int maxNumber) {
    Random number = Random();
    return number.nextInt(maxNumber);
  }
}
