public class ParticleTexture extends AirParticle{
    PImage img;
    float xspin, yspin, zspin;
    float size;

    public ParticleTexture(PVector l, PVector v, color c, int ls, PImage img) {
        super(l, v, c, ls);
        this.img = img;
        xspin = random(0, 1);
        yspin = random(0, 1);
        zspin = random(0, 1);
        size = random(3, 20);
    }

    void display() {
        float spinFactor = velocity.mag();
        pushMatrix();
            translate(location.x, location.y, location.z);
            rotateX(xspin * spinFactor);
            rotateY(yspin * spinFactor);
            rotateZ(zspin * spinFactor);
            noStroke();
            beginShape(QUADS);
            texture(img);
            vertex(0, 0, 0, 0, 0);
            vertex(size, 0, 0, img.width, 0);
            vertex(size, size, 0, img.width, img.height);
            vertex(0, size, 0, 0, img.height);
            endShape(CLOSE);
        popMatrix();
    }

}
