import controlP5.*;

ControlP5 cp5;
Textlabel noOfParticles, fps;

class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    // surface.setLocation(10, 10);
    cp5 = new ControlP5(this);

    Group g1 = cp5.addGroup("Particle properties")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(100)
                ;
    particleColor = cp5.addColorPicker("particleColorPicker")
          .plugTo(parent)
          .setPosition(5, 5)
          .setColorValue(color(240, 0, 0, 255))
          .moveTo(g1)
          ;
    cp5.addSlider("pLifespan")
        .plugTo(parent)
        .setValue(pLifespan)
        .setPosition(5,70)
        .setRange(0, 1500)
        .moveTo(g1);

    Group g2 = cp5.addGroup("Environment properties")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(30)
                ;
    cp5.addSlider("gravityVal")
     .plugTo(parent)
     .setValue(gravityVal)
     .setPosition(5,5)
     .setRange(0, 0.5)
     .moveTo(g2);
    
    cp5.addKnob("windAngle")
        .plugTo(parent)
        .setAngleRange(2*PI)
        .setViewStyle(Knob.ELLIPSE)
        .setStartAngle(PI/2)
        .setRange(0,360)
        .setValue(0)
        .setPosition(5,20)
        .setRadius(30)
        .setDragDirection(Knob.HORIZONTAL)
        .moveTo(g2)
        ;
    
    cp5.addSlider("windMag")
     .plugTo(parent)
     .setValue(windMag)
     .setPosition(70,40)
     .setRange(0, 0.1)
     .setDecimalPrecision(3)
     .moveTo(g2);

    Accordion accordion = cp5.addAccordion("acc")
                            .setPosition(5,5)
                            .setWidth(300)
                            .addItem(g1)
                            .addItem(g2)
                            ;
  
    accordion.open(0, 1);
    accordion.setCollapseMode(Accordion.MULTI);

    noOfParticles = cp5.addTextlabel("noOfParticlesLabel")
                    .setColorValue(0)
                    .setPosition(5, h - 30);

    fps = cp5.addTextlabel("fpsLabel")
                    .setColorValue(0)
                    .setPosition(5, h - 20);
  }



  void draw() {
    background(190);
  }
}