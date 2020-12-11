class AirParticle extends Particle {
    
    AirParticle(PVector l, PVector v, color c, int ls) {
        super(l, v, c, ls);
    }

    void update() {
        velocity.add(acceleration);
        lastLocation = location.copy();
        location.add(velocity);
        acceleration.mult(0);
        super.update();
    }

    void display() {
        stroke(this.col);
        strokeWeight(2);
        line(lastLocation.x, lastLocation.y, lastLocation.z, 
        location.x, location.y, location.z);

        // point(location.x, location.y, location.z);
        
        // pushMatrix();
        // translate(location.x, location.y, location.z);
        // fill(this.col);
        // sphere(2);
        // popMatrix();
    }
}