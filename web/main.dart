#import('dart:html');

#source('application/frame_counter.dart');
#source('application/game.dart');

FrameCounter counter;

bool onUpdate(int time) { counter.draw(); window.requestAnimationFrame(onUpdate); }

/**
 * Main entrypoint for every Dart application.
 */
void main()
{
  counter = new FrameCounter('#frame_counter');
  print(counter.fps);

  //window.requestAnimationFrame(onUpdate);
}
