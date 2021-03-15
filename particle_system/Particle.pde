/* Particle is an abstract base class that defines the basic
 * behaviours of a particle with Newtonian motion laws. Its
 * display() method needs to be implemented by all its
 * subclasses.
 */
abstract class Particle {
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

  abstract void display();
  
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
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  public PVector getLocation() {
      return location;
  }
  
  public PVector getLastLocation() {
      return lastLocation;
  }
  
}
