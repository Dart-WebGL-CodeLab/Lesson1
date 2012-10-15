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
  counter.font = '36px "Lucida Console", Monaco, monospace';
  counter.canvasWidth = 600;
  counter.canvasHeight = 300;
  counter.textHeight = 36.0;
  //counter.draw();

  window.requestAnimationFrame(onUpdate);
}
