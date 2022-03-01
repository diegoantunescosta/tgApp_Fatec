import 'package:flutter/material.dart';

const primaryColor = const Color(0xFFfbab66);
const primaryLight = const Color(0xFFFF9F59);
const primaryDark = const Color(0xFFFF9F59);

const secondaryColor = const Color(0xFFFF9F59);
const secondaryLight = const Color(0xFFFF9F59);
const secondaryDark = const Color(0xFFFF9F59);

const Color gradientStart = const Color(0xFFFFCA7A);
const Color gradientEnd = const Color(0xFFFF918D);
const Color white = const Color (0xFFFFFFFF);

const primaryGradient = const LinearGradient(
  colors: const [gradientStart, gradientEnd],
  stops: const [0.0, 1.0],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const chatBubbleGradient = const LinearGradient(
  colors: const [Color(0xFFFD60A3), Color(0xFFFF8961)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);

const chatBubbleGradient2 = const LinearGradient(
  colors: const [Color(0xFFFFFFFF), Color(0xFFFFFFFF)],
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
);
