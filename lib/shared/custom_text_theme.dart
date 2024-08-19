import 'package:flutter/material.dart';

extension CustomTextTheme on TextTheme {
  // In cases where additional styles beyond fontSize are needed,
  // use the copyWith method and specify the desired styles directly,
  // instead of adding styles here.

  TextStyle? get smaller => displaySmall?.copyWith(fontSize: 12);

  TextStyle? get small => displaySmall?.copyWith(fontSize: 14);

  TextStyle? get normal => displaySmall?.copyWith(fontSize: 16);

  TextStyle? get large => displaySmall?.copyWith(fontSize: 20);

  TextStyle? get larger => displaySmall?.copyWith(fontSize: 24);

  TextStyle? get xLarger => displaySmall?.copyWith(fontSize: 30);

  TextStyle? get xxLarger => displaySmall?.copyWith(fontSize: 36);

  TextStyle? get xxxLarger => displaySmall?.copyWith(fontSize: 42);

  TextStyle? get extraLarger => displaySmall?.copyWith(fontSize: 48);

  TextStyle? get xExtraLarger => displaySmall?.copyWith(fontSize: 54);
}
