import java.util.LinkedList;
import java.util.ListIterator;

class ParticleSystem {
    LinkedList<Particle> particles;
    PVector emitterPos;
    RenderMode renderMode;
    PImage textureImg = loadImage("../University/particle_system/blood_particle_system/particle_system/flower.png");

    public ParticleSystem(RenderMode renderMode, PVector emitterPos) {
        this.renderMode = renderMode;
        this.emitterPos = emitterPos;
        particles = new LinkedList<Particle>();
    }

    public void addParticle(color c) {
        PVector initialPos = emitterPos;
        PVector initialV = new PVector(random(-1,1),random(-2,1), 0.0);
        Particle p;
        switch (this.renderMode) {
            case POINT :
                p = new ParticlePoint(initialPos, initialV, c, pLifespan);
            break;
            case LINE :
                p = new ParticleLine(initialPos, initialV, c, pLifespan);
            break;
            case QUAD :
                p = new ParticleQuad(initialPos, initialV, c, pLifespan);
            break;
            case TEXTURE :
                p = new ParticleTexture(initialPos, initialV, c, pLifespan, textureImg);
            break;
            default :
                p = new ParticlePoint(initialPos, initialV, c, pLifespan);
            break;
        }
        particles.add(p);
    }

    public void applyForce(PVector f) {
        for (Particle p : particles) {
            p.applyForce(f);
        }
    }
    public void run(Floor f) {
        ListIterator<Particle> iter = particles.listIterator();
        while (iter.hasNext()) {
            Particle p = iter.next();
            p.run();
            if (floorSwitch) {
                iter.set(hitFloor(p, f));
            }
            if (p.isDead()) {
                iter.remove();
            }
        }
    }

    public Particle hitFloor(Particle p, Floor f) {
        if (!(p instanceof GroundParticle) && p.location.y >= f.yHeight) {
            return new GroundParticle(p.location, p.col, p.lifespan);
        } else {
            return p;
        }
    }

    public int getSize() {
        return particles.size();
    }
}