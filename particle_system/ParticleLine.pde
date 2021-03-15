public class ParticleLine extends AirParticle {

    public ParticleLine(PVector l, PVector v, color c, int ls) {
        super(l, v, c, ls);
    }

    void display() {
        stroke(this.col);
        strokeWeight(2);
        line(lastLocation.x, lastLocation.y, lastLocation.z, 
        location.x, location.y, location.z);
    }

}
