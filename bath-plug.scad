lowerCircleRadius = 20;
lowerCircleHeight = 6;

upperCircleRadius = 24;
upperCircleHeight = 4;

handle = true;

handleRadius = 2;
handleHeight = 15;
handleWidth = 20;

module segment(height, radius) {
    cylinder(height, radius, radius);
}
// lower circle
segment(lowerCircleHeight, lowerCircleRadius);

// upper circle
translate([0, 0, lowerCircleHeight]) {
    segment(upperCircleHeight, upperCircleRadius);
}

// handle
if(handle) {  
    height = lowerCircleHeight + upperCircleHeight;
    union() {
        // |-| [0]
        translate([handleWidth / 2, 0, height]) {
            segment(handleHeight, handleRadius);
        }
        
        // |-| [1]
        translate([0 - (handleWidth / 2), 0, height + handleHeight - handleRadius]) {            
            rotate([0, 90, 0]) {
                segment(handleWidth, handleRadius);
            }
        }
        
        // |-| [2]
        translate([0 - (handleWidth / 2), 0, height]) {
            segment(handleHeight, handleRadius);
        }
    }
}