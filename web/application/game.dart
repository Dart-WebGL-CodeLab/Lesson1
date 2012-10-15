
class Game
{
  //---------------------------------------------------------------------
  // Class variables
  //---------------------------------------------------------------------

  static Game _gameInstance;

  //---------------------------------------------------------------------
  // Member variables
  //---------------------------------------------------------------------

  // Insert any additional member variables here ...

  WebGLRenderingContext _context;
  vec3 _color;
  vec3 _direction;
  Random _randomGenerator;

  //---------------------------------------------------------------------
  // Construction
  //---------------------------------------------------------------------

  Game(String id)
  {
    CanvasElement canvas = document.query(id) as CanvasElement;

    assert(canvas != null);
    _context = canvas.getContext('experimental-webgl');

    assert(_context != null);
    _context.viewport(0, 0, 800, 600);

    _color = new vec3(0.0, 0.0, 0.0);
    _direction = new vec3(1.0, 1.0, 1.0);
    _randomGenerator = new Random();
  }

  //---------------------------------------------------------------------
  // Public methods
  //---------------------------------------------------------------------

  void update(int time)
  {
    for (int i = 0; i < 3; ++i)
    {
      // Add a random difference
      _color[i] += _direction[i] * (_randomGenerator.nextDouble() * 0.01);

      // Colors range from [0, 1]
      if (_color[i] > 1.0)
      {
        _color[i] = 1.0;
        _direction[i] = -1.0;
      }
      else if (_color[i] < 0.0)
      {
        _color[i] = 0.0;
        _direction[i] = 1.0;
      }
    }
  }

  void draw()
  {
    _context.clearColor(_color.x, _color.y, _color.z, 1.0);
    _context.clear(WebGLRenderingContext.COLOR_BUFFER_BIT | WebGLRenderingContext.DEPTH_BUFFER_BIT);
  }

  //---------------------------------------------------------------------
  // Static methods
  //---------------------------------------------------------------------

  static void onInitialize()
  {
    _gameInstance = new Game('#webgl_host');
  }

  static void onUpdate(int time)
  {
    _gameInstance.update(time);
    _gameInstance.draw();
  }
}
