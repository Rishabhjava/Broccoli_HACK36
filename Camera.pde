class Camera {
  PVector pos;

  Camera() {
    pos = new PVector(0, 0);
  }

  void draw() {
    pos.x += speed;
    if (pos.x > 59500) {
      pos.x = 59500;
    }
  }
}
