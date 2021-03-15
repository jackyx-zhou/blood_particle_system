class Floor {
    float yHeight = 0.8*height;

    void display() {
        pushMatrix();
        noFill();
        stroke(0);
        translate(width/2, yHeight,0);
        rectMode(CENTER);
        rotateX(PI/2);
        rect(0, 0, width, width);
        popMatrix();
    }
}