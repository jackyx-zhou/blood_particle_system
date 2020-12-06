class GroundParticle extends Particle {
    float radius;
    GroundParticle(PVector l, color c, float ls) {
        super(l, new PVector(0,0,0), c, ls+100);
        radius = random(20);
    }

    @Override
    void update() {
        lifespan -= 2;
    }

    @Override
    void display() {
        pushMatrix();
        noStroke();
        fill(this.col, lifespan);
        translate(this.location.x, this.location.y, this.location.z);
        rotateX(PI/2);
        ellipse(0, 0, radius, radius);
        popMatrix();
  }
}