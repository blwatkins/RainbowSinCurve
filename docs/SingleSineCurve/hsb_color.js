// Rainbow Sine Curve Visualization
// HSB Color Functions
// Functions for working with HSB colors
// 0-360 scale

const ColorType = {
    RAINBOW: 1,
    SOFT: 2,
    WARM: 3,
    TOPC: 4,
    BOTTOMC: 5
};

function getRandomColorType() {
    var rand = parseInt(random(1000));
    var choice = ColorType.RAINBOW;

    switch (rand % 5) {

        case 0:
            choice = ColorType.RAINBOW;
            break;

        case 1:
            choice = ColorType.SOFT;
            break;

        case 2:
            choice = ColorType.WARM;
            break;

        case 3:
            choice = ColorType.TOPC;
            break;

        case 4:
            choice = ColorType.BOTTOMC;
            break;

        default:
            choice = ColorType.RAINBOW;
            break;
    }

    return choice;
}

function mapColor(type, num, min, max) {
    var hue = 0;

    switch (type) {

        case ColorType.RAINBOW:
            hue = parseInt(map(num, min, max, 0, 360));
            break;

        case ColorType.SOFT:
            hue = parseInt(map(num, min, max, 90, 285));
            break;

        case ColorType.WARM:
            hue = parseInt(map(num, min, max, 0, 70));
            break;

        case ColorType.TOPC:
            hue = parseInt(map(num, min, max, 180, 360));
            break;

        case ColorType.BOTTOMC:
            hue = parseInt(map(num, min, max, 0, 180));
            break;

        default:
            hue = 0;
            break;
    }

    return color(hue, 360, 360);
}
