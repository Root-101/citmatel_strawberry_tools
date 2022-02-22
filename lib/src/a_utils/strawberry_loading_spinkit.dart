import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class StrawberryLoadingSpinkit {
  static final Random _random = Random();

  static randomLoadingSpinkit({Color color = Colors.white, double size = 50}) {
    return kits(color: color, size: size)[_random.nextInt(kits().length)];
  }

  static List<Widget> kits({Color color = Colors.white, double size = 50}) {
    return <Widget>[
      SpinKitRotatingCircle(color: color, size: size),
      SpinKitRotatingPlain(color: color, size: size),
      SpinKitChasingDots(color: color, size: size),
      SpinKitPumpingHeart(color: color, size: size),
      SpinKitPulse(color: color, size: size),
      SpinKitDoubleBounce(color: color, size: size),
      SpinKitWave(color: color, size: size, type: SpinKitWaveType.start),
      SpinKitWave(color: color, size: size, type: SpinKitWaveType.center),
      SpinKitWave(color: color, size: size, type: SpinKitWaveType.end),
      SpinKitPianoWave(
          color: color, size: size, type: SpinKitPianoWaveType.start),
      SpinKitPianoWave(
          color: color, size: size, type: SpinKitPianoWaveType.center),
      SpinKitPianoWave(
          color: color, size: size, type: SpinKitPianoWaveType.end),
      SpinKitThreeBounce(color: color, size: size),
      SpinKitThreeInOut(color: color, size: size),
      SpinKitWanderingCubes(color: color, size: size),
      SpinKitWanderingCubes(color: color, size: size, shape: BoxShape.circle),
      SpinKitCircle(color: color, size: size),
      SpinKitFadingFour(color: color, size: size),
      SpinKitFadingFour(color: color, size: size, shape: BoxShape.rectangle),
      SpinKitFadingCube(color: color, size: size),
      SpinKitCubeGrid(color: color, size: size),
      SpinKitFoldingCube(color: color, size: size),
      SpinKitRing(color: color, size: size),
      SpinKitDualRing(color: color, size: size),
      SpinKitSpinningLines(color: color, size: size),
      SpinKitFadingGrid(color: color, size: size),
      SpinKitFadingGrid(color: color, size: size, shape: BoxShape.rectangle),
      SpinKitSquareCircle(color: color, size: size),
      SpinKitSpinningCircle(color: color, size: size),
      SpinKitSpinningCircle(
          color: color, size: size, shape: BoxShape.rectangle),
      SpinKitFadingCircle(color: color, size: size),
      SpinKitHourGlass(color: color, size: size),
      SpinKitPouringHourGlass(color: color, size: size),
      SpinKitPouringHourGlassRefined(color: color, size: size),
      SpinKitRipple(color: color, size: size),
      SpinKitDancingSquare(color: color, size: size),
    ];
  }
}
