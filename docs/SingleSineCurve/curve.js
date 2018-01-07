// Rainbow Sine Curve Visualization
// Curve Class

function Curve(baseX, baseY, len, amp, frequency, numPoints) {
    this.baseX = baseX;
    this.baseY = baseY;
    this.len = len;
    this.frequency = frequency;
    this.amp = amp;
    this.numPoints = numPoints;
    this.points = [];

    this.createPoints = function() {
        var pointX = baseX;
        var pointTheta = 0;

        for (var i = 0; i < numPoints; i++) {
            pointX = this.calculatePoint(i);
            this.points.push(new Point(pointX, this.baseY, pointTheta, this.amp));
            pointTheta += ((TWO_PI * this.frequency) / this.numPoints);
        }

    };

    this.calculatePoint = function(num) {
        var result = num * (this.len / (this.numPoints - 1)) + this.baseX;
        return result;
    };
    
    this.createPoints();

    this.display = function() {
        this.points.forEach(this.displayPoint);
    };

    this.displayPoint = function(point) {
        point.display();
    };

    this.move = function() {
        this.points.forEach(this.movePoint);
    };

    this.movePoint = function(point) {
        point.move();
    };

    this.setColor = function(colorType) {

        for (var i = 0; i < this.points.length; i++) {
            var p = this.points[i];
            p.setColor(mapColor(colorType, p.theta % TWO_PI, 0, TWO_PI));
        }

    };

    this.setAmp = function(newAmp) {

        for (var i = 0; i < this.points.length; i++) {
            this.points[i].setAmp(newAmp);
        }

        this.amp = newAmp;
    };

    this.increaseAmp = function() {

        if (this.amp < height / 2) {
            this.setAmp(this.amp + 1);
        }

    };

    this.decreaseAmp = function() {

        if (this.amp > 10) {
            this.setAmp(this.amp - 1);
        }

    };

}