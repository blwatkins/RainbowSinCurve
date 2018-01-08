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
    this.deltaTheta = 0;

    this.cycle = parseInt(this.numPoints / this.frequency);

    if (this.cycle < 1) {
        this.cycle = 1;
    }

    this.colorCycle = this.cycle;
    this.colorType = ColorType.RAINBOW;

    this.createPoints = function() {
        var pointX = baseX;
        var pointTheta = 0;
        this.deltaTheta = (TWO_PI * this.frequency) / this.numPoints;

        if (this.numPoints < 2) {
            this.numPoints = 2;
        }

        for (var i = 0; i < this.numPoints; i++) {
            pointX = this.calculatePoint(i);
            this.points.push(new Point(pointX, this.baseY, pointTheta, this.amp));
            pointTheta += this.deltaTheta;
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
        this.colorType = colorType;

        for (var i = 0; i < this.points.length; i++) {
            var p = this.points[i];
            p.setColor(mapColor(colorType, i % this.colorCycle, 0, this.colorCycle));
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

    this.checkFrequency = function() {
        var curFrequency = parseInt(this.numPoints / this.cycle);

        if (curFrequency > this.frequency) {
            this.frequency++;
        } else if (curFrequency + 1 <= this.frequency) {

            if (parseInt(this.numPoints % this.cycle) == 0 && this.frequency > 1) {
                this.frequency--;
            }

        }

    };

    this.decreasePoints = function() {

        if (this.points.length > 2) {
            var p = this.points.pop();
            this.numPoints--;
            this.checkFrequency();

            for (var i = 0; i < this.points.length; i++) {
                var pointX = this.calculatePoint(i);
                this.points[i].setX(pointX);
            }

        }

    };

    this.increasePoints = function() {
        this.numPoints++;

        for (var i = 0; i < this.numPoints; i++) {
            var pointX = this.calculatePoint(i);

            if (i == this.numPoints - 1) {
                var pointTheta = this.points[i - 1].getTheta() + this.deltaTheta;
                var p = new Point(pointX, this.baseY, pointTheta, this.amp);
                p.setColor(mapColor(this.colorType, i % this.colorCycle, 0, this.colorCycle));
                this.points.push(p);
                this.checkFrequency();
            } else {
                this.points[i].setX(pointX);
            }

        }

    };

    this.increaseFrequency = function() {
        this.frequency++;
        this.deltaTheta = (TWO_PI * this.frequency) / this.numPoints;
        this.cycle = parseInt(this.numPoints / this.frequency);
        
        if (this.cycle < 1) {
            this.cycle = 1;
        }
        var pointTheta = 0;

        for (var i = 0; i < this.points.length; i++) {
            this.points[i].setTheta(pointTheta);
            pointTheta += this.deltaTheta;
        }
        
    };

    this.decreaseFrequency = function() {

        if (this.frequency > 1) {
            this.frequency--;

            this.deltaTheta = (TWO_PI * this.frequency) / this.numPoints;
            this.cycle = parseInt(this.numPoints / this.frequency);
           
            if (this.cycle < 1) {
                this.cycle = 1;
            }

            var pointTheta = 0;

            for (var i = 0; i < this.points.length; i++) {
                this.points[i].setTheta(pointTheta);
                pointTheta += this.deltaTheta;
            }

        }

    };

}