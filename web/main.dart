#import('dart:html');
#import('dart:math');
#import('package:spectre/spectre.dart');
#import('package:dartvectormath/vector_math_html.dart');

#source('application/frame_counter.dart');
#source('application/game.dart');

FrameCounter counter;

bool onUpdate(int time)
{
  counter.update(time);
  Game.onUpdate(time);
  window.requestAnimationFrame(onUpdate);
}

/**
 * Main entrypoint for every Dart application.
 */
void main()
{
  Game.onInitialize();
  counter = new FrameCounter('#frame_counter');//, 600, 300, 120);
  //counter.font = '36px "Lucida Console", Monaco, monospace';
  //counter.textHeight = 36.0;
  //counter.draw();

  window.requestAnimationFrame(onUpdate);
}
