//---------------------------------------------------------------------
// Library imports
//
// Allows libraries to be accessed by the application.
// Core libraries are prefixed with dart.
// Third party libraries are specified in the pubspec.yaml file
// and imported with the package prefix.
//---------------------------------------------------------------------

library webgl_lab;

import 'dart:html';
import 'dart:math';
import 'package:spectre/spectre.dart';
import 'package:vector_math/vector_math_browser.dart';

//---------------------------------------------------------------------
// Source files
//---------------------------------------------------------------------

part 'application/frame_counter.dart';
part 'application/game.dart';

/// The [FrameCounter] associated with the application
FrameCounter _counter;

/**
 * Main entrypoint for every Dart application.
 */
void main()
{
  Game.onInitialize();
  _counter = new FrameCounter('#frame_counter');
}
