import java.util.ListIterator;

class ParticleSystem {
    private ArrayList<Particle> particles;

    public ParticleSystem() {
        particles = new ArrayList<Particle>();
    }
    public void addParticle(color c) {
        PVector initialPos = new PVector(width/2 + random(-2, 2), 30, 0);
        PVector initialV = new PVector(random(-1,1),random(-2,1), 0.0);
        Particle p = new Particle(initialPos, initialV,c);
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
            iter.set(hitFloor(p, f));
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