class Particle {
  PVector location;
  PVector lastLocation;
  PVector velocity;
  PVector acceleration;
  color col;
  int lifespan;

  Particle(PVector l, PVector v, color c, int ls) {
    location = l.copy();
    acceleration = new PVector(0, 0, 0);
    velocity = v;
    col = c;
    lifespan = ls;
  }
  
  void run() {
    update();
    display();
  }
 
  void update() {
    lifespan -= 1;
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }
 
  void display() {
    // pushMatrix();
    // noStroke();
    // fill(240, 255-lifespan, 255-lifespan, 255-lifespan);
    // translate(location.x, location.y, location.z);
    // ellipse(0, 0, 5, 5);
    // popMatrix();

    // stroke(240, 0, 0, lifespan);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
