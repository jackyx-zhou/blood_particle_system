public class AreaEmitter extends ParticleSystem {
    
    public AreaEmitter(RenderMode renderMode) {
        super(renderMode);   
    }

    @Override
    public void addParticle(color c) {
        PVector initialPos = new PVector(random(0, width), 30, random(-width/2, width/2));
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


    public void run() {
        ListIterator<Particle> iter = particles.listIterator();
        while (iter.hasNext()) {
            Particle p = iter.next();
            p.run();
            if (p.isDead()) {
                iter.remove();
            }
        }
    }

    public LinkedList<Particle> getParticles() {
        return particles ;
    }
    
}
