import 'dart:math';

solveQuadratic(a, b, c) {
  var d = b * b - 4 * a * c;
  if (d > 0) {
    return [(-b + sqrt(d)) / (2 * a), (-b - sqrt(d)) / (2 * a)];
  } else if (d == 0) {
    return [-b / (2 * a)];
  } else {
    return null;
  }
}
