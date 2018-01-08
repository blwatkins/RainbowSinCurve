// Rainbow Sine Curve Visualization
// Point Class

function Point(baseX, baseY, theta, amp) {

    this.calculateSin = function() {
        return baseY + (sin(this.theta) * this.amp);
    };

    this.theta = theta;
    this.amp = amp;
    this.baseX = baseX;
    this.baseY = baseY;
    this.x = baseX;
    this.y = this.calculateSin();
    this.col = color(255);

    this.display = function() {
        stroke(this.col);
        strokeWeight(5);
        point(this.x, this.y);
    };

    this.move = function() {
        this.theta = this.theta + 0.1;
        this.y = this.calculateSin();
    };

    this.setAmp = function(newAmp) {
        this.amp = newAmp;
    };

    this.setColor = function(newCol) {
        this.col = newCol;
    };

    this.setX = function(newX) {
        this.x = newX;
    };

    this.setTheta = function(newTheta) {
        this.theta = newTheta;
    };

    this.getTheta = function() {
        return this.theta;
    };

}
