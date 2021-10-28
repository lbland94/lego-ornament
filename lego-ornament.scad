use <lego.scad>;

//$fa=5;

size=(4 * 25.4) / 2;
wall_thickness=2.4;
platform_height=0.22;

/* [Hidden] */
p_height_offset = (size * 2 * platform_height);

translate([0, 0, size + 7 - wall_thickness]) hanger();

difference() {
    sphere(r=size);
//    translate([0, 0, -size + p_height_offset / 2]) cube([2*size, 2*size, p_height_offset], center=true);
    difference() {
        translate([0, 20 + 10, 10]) rotate([0,90, 0]) cylinder(r=size * 0.8, h=2*size, center=true);
        translate([0, 0, -size + p_height_offset / 2]) cube([2*size, 2*size, p_height_offset], center=true);
    }
    difference() {
        scale((size - wall_thickness)/size) sphere(r=size);
        translate([0, 0, -size + p_height_offset / 2]) cube([2*size, 2*size, p_height_offset], center=true);
    }
}

intersection() {
    translate([0, 1, -size + p_height_offset]) block(
      width=12,
      length=12,
      height=1,
      reinforcement=true,
      type="baseplate"
    );
    cylinder(r=(pow(pow(size, 2) - pow(size - p_height_offset, 2), 0.5)), h=2*size, center=true);
    sphere(r=size);
}

module hanger(hole_radius=3, wall_thickness=4) {
    rotate([90, 0, 0])
    rotate_extrude()
        translate([wall_thickness/2 + hole_radius, 0]) circle(r=wall_thickness/2);
}