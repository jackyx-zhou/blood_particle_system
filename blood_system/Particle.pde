class Particle {
  PVector location;
  PVector lastLocation;
  PVector velocity;
  PVector acceleration;
  color col;
  
  float lifespan = 255;
  
  Particle(PVector l, PVector v, color c) {
    location = l.copy();
    acceleration = new PVector(0, 0, 0);
    velocity = v;
    col = c;
    lifespan = 255;
  }

  Particle(PVector l, PVector v, color c, float ls) {
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
    velocity.add(acceleration);
    lastLocation = location.copy();
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 2;
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
    stroke(this.col);
    strokeWeight(2);
    line(lastLocation.x, lastLocation.y, lastLocation.z, 
      location.x, location.y, location.z);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
