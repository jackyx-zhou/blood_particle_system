import controlP5.*;

ControlP5 cp5;

Textlabel noOfParticles, fps;
Button startRecording, endRecording;
boolean recording;
int recordedTime;
Table table;

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

    Group g3 = cp5.addGroup("Rendering")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(50)
                ;
    cp5.addToggle("floorSwitch")
        .plugTo(parent)
        .setPosition(5, 5)
        .setSize(20,20)
        .moveTo(g3)
        .setValue(false)
    ;

    cp5.addSlider("birthRate")
        .plugTo(parent)
        .setValue(birthRate)
        .setPosition(5,40)
        .setRange(0, 200)
        .moveTo(g3);

    cp5.addRadioButton("renderModeButtons")
         .setPosition(5,55)
         .setSize(40,20)
         .setColorForeground(color(120))
         .setColorActive(color(255))
         .setColorLabel(color(255))
         .setItemsPerRow(4)
         .setSpacingColumn(30)
         .addItem("Point",0)
         .addItem("Line",1)
         .addItem("Quad",2)
         .addItem("Texture",3)
         .activate(0)
         .plugTo(parent)
         .moveTo(g3)
         ;

    Accordion accordion = cp5.addAccordion("acc")
                            .setPosition(5,5)
                            .setWidth(300)
                            .addItem(g1)
                            .addItem(g2)
                            .addItem(g3)
                            ;
  
    accordion.open(0, 1, 2);
    accordion.setCollapseMode(Accordion.MULTI);

    noOfParticles = cp5.addTextlabel("noOfParticlesLabel")
                    .setColorValue(0)
                    .setPosition(5, h - 50);

    fps = cp5.addTextlabel("fpsLabel")
                    .setColorValue(0)
                    .setPosition(5, h - 40);
    
    startRecording = cp5.addButton("Start Recording")
     .setPosition(5, h-25)
     .setSize(100, 15)
     .show()
     ;
    endRecording = cp5.addButton("End Recording")
     .setPosition(5, h-25)
     .setSize(100, 15)
     .hide()
     ;
    
    startRecording.onClick(new CallbackListener() {
        public void controlEvent(CallbackEvent theEvent) {
        endRecording.show();
        startRecording.hide();
        table = new Table();
  
        table.addColumn("num_of_particles");
        table.addColumn("fps");
        recording = true;
        recordedTime = millis();
        }
    });

    endRecording.onClick(new CallbackListener() {
        public void controlEvent(CallbackEvent theEvent) {
        startRecording.show();
        endRecording.hide();
        String filename;
        if (floorSwitch) {
            filename = String.format("../University/particle_system/blood_particle_system/blood_system/data/%s-floor-fps.csv", currentRenderMode);
        } else {
            filename = String.format("../University/particle_system/blood_particle_system/blood_system/data/%s-fps.csv", currentRenderMode);
        }
        saveTable(table, filename);
        }
    });
  }

  void draw() {
    background(190);
  }
}