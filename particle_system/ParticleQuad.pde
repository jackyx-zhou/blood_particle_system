public class ParticleQuad extends AirParticle{

    public ParticleQuad(PVector l, PVector v, color c, int ls) {
        super(l, v, c, ls);
    }

    void display() {
        pushMatrix();
            translate(location.x, location.y, location.z);
            rotateX(random(0, 1));
            rotateY(random(0, 1));
            rotateZ(random(0, 1));
            fill(255, 204, 255);
            noStroke();
            beginShape(QUADS);
            normal(0, 0, 1);
            vertex(2, 2, -1);
            vertex(8, 2, 1);
            vertex(8, 8, -1);
            vertex(2, 8, 1);
            endShape(CLOSE);
        popMatrix();
    }

}
