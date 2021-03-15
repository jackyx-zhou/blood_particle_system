public class ParticlePoint extends AirParticle {

    public ParticlePoint(PVector l, PVector v, color c, int ls) {
        super(l, v, c, ls);
    }

    void display() {
        stroke(this.col);
        point(location.x, location.y, location.z);
    }

}
