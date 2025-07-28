import 'package:study_flutter/main.dart';

void main() {
  int c = add(1, 2);
  logger.d('message ----------> c = $c');
}

int add(int a, int b) => a + b;
