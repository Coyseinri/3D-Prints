// XIAO ESP32-S3 + Open-Smart RF433 enclosure

$fn = 64;
part = "exploded";          // body, lid, assembly, exploded, rail_test
show_components = true;     // preview-only envelopes in assembly/exploded

// Enclosure and lid

outer_x = 60.0;
outer_y = 55.0;
body_h = 16.6;
wall = 2.0;                 // five 0.4 mm extrusion lines
floor_t = 3.0;
outer_r = 3.0;

lid_t = 4.0;
slide_clearance = 0.30;     // per sliding face; tune with rail-test STL
rail_depth = 1.10;
rail_drop = 1.20;
rail_t = 1.20;              // three 0.4 mm extrusion lines
end_bar_t = 3.0;

guide_t = 1.20;             // three 0.4 mm extrusion lines
xiao_guide_gap = 0.20;
rf_guide_gap = 0.20;
guide_h = 2.40;

eps = 0.05;

// XIAO ESP32-S3

xiao_x = 31.0;
xiao_y = 3.0;
xiao_x_size = 17.8;
xiao_y_size = 21.0;
xiao_pcb_t = 1.25;          // measured from official STEP PCB solid
xiao_total_h = 4.46;        // official STEP overall component envelope
xiao_seat_clear = 0.35;
xiao_support_z = 4.0;
xiao_gpio_relief_bottom_z = 2.20;
xiao_gpio_row_w = 3.20;
xiao_glue_pocket_x = 10.0;
xiao_glue_pocket_y = 10.0;
xiao_glue_pocket_bottom_z = 2.25;

// USB-C opening

usb_step_w = 8.94;
usb_step_h = 4.20;
usb_cut_w = 10.0;
usb_cut_h = 4.80;
usb_outer_flare_w = 11.0;
usb_outer_flare_h = 5.80;
usb_flare_depth = 0.80;
usb_cut_z_offset = 0.30;    // raised after first physical fit check
usb_center_x = xiao_x + xiao_x_size / 2;
usb_center_z = xiao_support_z + 0.26 + usb_step_h / 2
               + usb_cut_z_offset;

// RF433 board

rf_x = 4.0;
rf_y = 3.0;
rf_x_size = 24.0;
rf_y_size = 30.0;
rf_pcb_t = 1.60;
rf_total_h = 7.0;           // conservative envelope from supplied side view
rf_seat_clear = 0.35;
rf_support_z = floor_t;     // PCB lies directly on the enclosure floor
rf_hole_d = 2.30;
rf_hole_offset = 2.20;
rf_peg_d = 1.55;
rf_peg_tip_d = 1.00;
rf_peg_tip_h = 0.40;
rf_peg_extra_h = 0.20;
rf_guide_top_z = 6.40;
rf_guide_top_flat = 0.60;
rf_guide_left_outer_x = wall - 0.20; // positive overlap into wall
rf_guide_right_outer_x = 30.20;
rf_guide_len = 4.50;

// RF433 header and wiring clearance

rf_header_x = rf_x + 3.5;
rf_header_w = 10.5;
rf_header_tail_y = rf_y + rf_y_size - 6.2;
rf_header_tail_d = 6.5;
rf_header_relief_bottom_z = 1.50;
rf_glue_pocket_x = 10.0;
rf_glue_pocket_y = 10.0;
rf_glue_pocket_bottom_z = 2.25;
dupont_x = rf_x + 3.5;
dupont_y = rf_y + rf_y_size;
dupont_w = 10.5;
dupont_d = 18.0;
dupont_h = 5.0;

// Wi-Fi antenna

antenna_x = 19.0;
antenna_y = 34.5;
antenna_x_size = 37.4;
antenna_y_size = 17.5;
antenna_seat_clear = 0.30;
antenna_seat_depth = 0.20;
antenna_t = 0.35;           // preview envelope only

// M3 lid lock

lock_x = 53.5;
lock_y = 29.5;
lock_shelf_x0 = 49.0;
lock_shelf_x1 = 58.20;
lock_shelf_y = 9.0;
lock_shelf_t = 3.40;
lock_top_gap = slide_clearance;
lock_top_z = body_h - lid_t - lock_top_gap;
lock_screw_clear_d = 3.50;
lock_head_recess_d = 6.20;  // clearance for DIN 7985 M3 lens/pan head
lock_head_entry_d = 6.50;   // 0.30 mm lead-in chamfer at the outer face
lock_head_recess_depth = 2.60;
lock_nut_af = 5.50;
lock_nut_h = 2.40;
lock_nut_clear_per_face = 0.20;
lock_nut_trap_af = lock_nut_af + 2 * lock_nut_clear_per_face;
lock_nut_trap_corner_d = lock_nut_trap_af / cos(30);
lock_nut_trap_depth = 2.55;
lock_endbar_notch_clear = 0.30;
lock_endbar_outer_skin = 1.50;

// OpenShock lid engraving

logo_size = 28.0;
logo_cx = 26.0;
logo_cy = 27.5;
logo_recess_depth = 0.60;  // three 0.20 mm layers
logo_arc_segments = 28;

// Derived values and geometry checks

lid_under_z = body_h - lid_t;
lock_xiao_gap = (lock_y - lock_shelf_y/2) -
                (xiao_y + xiao_y_size + xiao_seat_clear);
lock_antenna_gap = (antenna_y - antenna_seat_clear) -
                   (lock_y + lock_shelf_y/2);
rf_top_gap = lid_under_z - (rf_support_z + rf_total_h);
xiao_top_gap = lid_under_z - (xiao_support_z + xiao_total_h);

assert(wall >= 2.0, "Wall must remain at least 2.0 mm for a 0.4 mm nozzle.");
assert(floor_t >= 2.4, "Floor is too thin for the solder-relief pockets.");
assert(lid_t >= 2.0, "Sliding lid panel is too thin.");
assert(rail_t >= 1.2, "Rails must be at least three extrusion lines thick.");
assert(rf_top_gap >= 1.5, "Not enough height above the RF component envelope.");
assert(xiao_top_gap >= 4.0, "Not enough height above the XIAO for soldered wiring.");
assert(xiao_x >= wall && xiao_y >= wall, "XIAO crosses the inner wall.");
assert(rf_x >= wall && rf_y >= wall, "RF board crosses the inner wall.");
assert(rf_x + rf_x_size <= xiao_x - 3.0, "XIAO/RF wiring gap is too small.");
assert(xiao_x + xiao_x_size <= outer_x - wall, "XIAO crosses the right inner wall.");
assert(rf_y + rf_y_size <= antenna_y - 1.5, "RF board is too close to the Wi-Fi antenna.");
assert(antenna_x >= wall && antenna_y >= wall, "Antenna crosses the inner wall.");
assert(dupont_x + dupont_w <= antenna_x - 1.0, "Antenna intrudes into the Dupont bay.");
assert(antenna_x + antenna_x_size <= outer_x - wall, "Antenna crosses the right inner wall.");
assert(antenna_y + antenna_y_size <= outer_y - wall - 0.8, "Antenna rear-wall clearance is too small.");
assert(dupont_x + dupont_w <= outer_x - wall, "Dupont bay crosses the right inner wall.");
assert(dupont_y + dupont_d <= outer_y - wall, "Dupont bay crosses the rear inner wall.");
assert(lock_nut_trap_corner_d + 2.0 <= min(lock_shelf_x1-lock_shelf_x0,
                                           lock_shelf_y),
       "Nut trap leaves less than 1.0 mm shelf wall.");
assert(lock_xiao_gap >= 0.50, "Lock shelf is too close to the XIAO.");
assert(lock_antenna_gap >= 0.15, "Lock shelf is too close to the antenna.");
assert(lock_top_z > floor_t + lock_nut_trap_depth + 2.0,
       "Lock bracket is too short for the nut and screw runout.");
assert(lid_t - lock_head_recess_depth >= 1.40,
       "Too little lid thickness remains beneath the screw-head recess.");
assert(lid_t-logo_recess_depth >= 3.40,
       "Too little lid thickness remains beneath the logo engraving.");
assert(logo_cx+logo_size/2 <= lock_x-lock_head_entry_d/2-5.0,
       "OpenShock logo is too close to the M3 counterbore.");
assert((outer_x - lock_endbar_outer_skin) - lock_shelf_x1 >=
       lock_endbar_notch_clear - 0.0001,
       "End-bar notch leaves too little clearance from the lock shelf.");
assert(xiao_glue_pocket_bottom_z >= 1.80,
       "Too little floor remains beneath the XIAO glue pocket.");
assert(rf_glue_pocket_bottom_z >= 1.80,
       "Too little floor remains beneath the RF433 glue pocket.");
assert(xiao_gpio_relief_bottom_z >= 2.0,
       "Too little floor remains beneath the XIAO solder channels.");
assert(rf_header_relief_bottom_z >= 1.5,
       "Too little floor remains beneath the RF header relief.");
assert(rf_hole_d-rf_peg_d >= 0.60,
       "RF locating pegs have too little diametral clearance.");
assert(rf_guide_top_z >= rf_support_z + rf_pcb_t + rf_peg_extra_h +
                         rf_peg_tip_h + 0.20 - 0.0001,
       "RF side guides do not rise above the tapered peg noses.");
assert(rf_guide_right_outer_x <= xiao_x - 0.75,
       "RF right-side guide leaves too little room before the XIAO.");
assert(abs(rf_support_z-floor_t) < 0.01,
       "The RF433 must lie directly on the enclosure floor.");
assert(6.0 >= (lid_t-lock_head_recess_depth) + lock_top_gap + lock_nut_h,
       "M3 x 6 screw cannot reach through the lid and nut.");

// Reusable geometry

module rounded_rect_2d(size=[10, 10], r=2) {
    hull()
        for (x = [r, size[0] - r])
            for (y = [r, size[1] - r])
                translate([x, y]) circle(r=r);
}

module rounded_prism(size=[10, 10, 2], r=2) {
    linear_extrude(height=size[2])
        rounded_rect_2d([size[0], size[1]], r);
}

module rounded_slot_y(size_x=10, size_z=5, r=1.3, depth=2) {
    hull()
        for (xx = [-size_x/2 + r, size_x/2 - r])
            for (zz = [-size_z/2 + r, size_z/2 - r])
                translate([xx, 0, zz])
                    rotate([-90, 0, 0]) cylinder(r=r, h=depth);
}

// Enclosure body

module body_shell() {
    rail_low_z = body_h - lid_t - rail_drop - slide_clearance;
    rail_high_z = body_h - lid_t + 0.15;
    groove_start_x = wall + 0.80;
    groove_l = outer_x - groove_start_x + 2 * eps;
    entry_top = rail_low_z;

    difference() {
        rounded_prism([outer_x, outer_y, body_h], outer_r);

        translate([wall, wall, floor_t])
            linear_extrude(height=body_h - floor_t + eps)
                rounded_rect_2d(
                    [outer_x - 2 * wall, outer_y - 2 * wall],
                    max(outer_r - wall, 0.8)
                );

        union() {
            translate([usb_center_x, -eps, usb_center_z])
                rounded_slot_y(usb_cut_w, usb_cut_h, 1.35, wall + 2 * eps);
            translate([usb_center_x, -eps, usb_center_z])
                rounded_slot_y(usb_outer_flare_w, usb_outer_flare_h, 1.60,
                               usb_flare_depth + eps);
        }

        translate([groove_start_x, 0, 0])
            hull() {
                translate([0, wall - rail_depth, rail_low_z])
                    cube([groove_l, rail_depth + eps, 0.12]);
                translate([0, wall - 0.15, rail_high_z - 0.12])
                    cube([groove_l, 0.15 + eps, 0.12]);
            }
        translate([groove_start_x, 0, 0])
            hull() {
                translate([0, outer_y - wall - eps, rail_low_z])
                    cube([groove_l, rail_depth + eps, 0.12]);
                translate([0, outer_y - wall - eps, rail_high_z - 0.12])
                    cube([groove_l, 0.15 + eps, 0.12]);
            }

        translate([outer_x - end_bar_t - eps,
                   wall - rail_depth - eps,
                   entry_top])
            cube([end_bar_t + 2 * eps,
                  outer_y - 2 * (wall - rail_depth) + 2 * eps,
                  body_h - entry_top + eps]);

        translate([xiao_x - 0.10,
                   xiao_y - xiao_seat_clear,
                   xiao_gpio_relief_bottom_z])
            cube([xiao_gpio_row_w + 0.20,
                  xiao_y_size + 2 * xiao_seat_clear,
                  floor_t - xiao_gpio_relief_bottom_z + eps]);
        translate([xiao_x + xiao_x_size - xiao_gpio_row_w - 0.10,
                   xiao_y - xiao_seat_clear,
                   xiao_gpio_relief_bottom_z])
            cube([xiao_gpio_row_w + 0.20,
                  xiao_y_size + 2 * xiao_seat_clear,
                  floor_t - xiao_gpio_relief_bottom_z + eps]);

        translate([xiao_x + (xiao_x_size - xiao_glue_pocket_x)/2,
                   xiao_y + (xiao_y_size - xiao_glue_pocket_y)/2,
                   xiao_glue_pocket_bottom_z])
            cube([xiao_glue_pocket_x,
                  xiao_glue_pocket_y,
                  floor_t - xiao_glue_pocket_bottom_z + eps]);

        translate([rf_x + (rf_x_size - rf_glue_pocket_x)/2,
                   rf_y + (rf_y_size - rf_glue_pocket_y)/2,
                   rf_glue_pocket_bottom_z])
            cube([rf_glue_pocket_x,
                  rf_glue_pocket_y,
                  floor_t - rf_glue_pocket_bottom_z + eps]);

        translate([rf_header_x,
                   rf_header_tail_y - 0.35,
                   rf_header_relief_bottom_z])
            cube([rf_header_w + 0.35,
                  rf_header_tail_d + 0.70,
                  floor_t - rf_header_relief_bottom_z + eps]);

        translate([antenna_x - antenna_seat_clear,
                   antenna_y - antenna_seat_clear,
                   floor_t - antenna_seat_depth])
            cube([antenna_x_size + 2 * antenna_seat_clear,
                  antenna_y_size + 2 * antenna_seat_clear,
                  antenna_seat_depth + eps]);
    }
}

module xiao_guides() {
    for (yy = [xiao_y, xiao_y + xiao_y_size - 2.5])
        translate([xiao_x + 4.0, yy, floor_t - eps])
            cube([xiao_x_size - 8.0, 2.5,
                  xiao_support_z - floor_t + eps]);

    for (xx = [xiao_x - xiao_guide_gap - guide_t,
               xiao_x + xiao_x_size + xiao_guide_gap])
        translate([xx, xiao_y + 6.5, floor_t - eps])
            cube([guide_t, 8.0, guide_h + eps]);
}

module rf_low_peg(px, py, clip_header_side=false) {
    if (clip_header_side)
        intersection() {
            translate([px, py, floor_t-eps])
                cylinder(d1=rf_peg_d, d2=rf_peg_tip_d,
                         h=rf_support_z-floor_t+rf_pcb_t+
                           rf_peg_extra_h+rf_peg_tip_h+eps);
            cube([rf_header_x - 0.50, outer_y, body_h]);
        }
    else {
        translate([px, py, floor_t-eps])
            cylinder(d1=rf_peg_d, d2=rf_peg_tip_d,
                     h=rf_support_z-floor_t+rf_pcb_t+
                       rf_peg_extra_h+rf_peg_tip_h+eps);
    }
}

module rf_guides_and_pegs() {
    rf_low_peg(rf_x + rf_x_size - rf_hole_offset,
               rf_y + rf_hole_offset, false);
    rf_low_peg(rf_x + rf_hole_offset,
               rf_y + rf_y_size - rf_hole_offset, false);

    left_inner_x = rf_x - rf_guide_gap;
    right_inner_x = rf_x + rf_x_size + rf_guide_gap;

    for (yy = [8.0, 19.0])
        translate([0, yy + rf_guide_len, 0])
            rotate([90, 0, 0])
                linear_extrude(height=rf_guide_len)
                    polygon(points=[
                        [rf_guide_left_outer_x, floor_t],
                        [left_inner_x, floor_t],
                        [left_inner_x, rf_guide_top_z],
                        [left_inner_x-rf_guide_top_flat, rf_guide_top_z]
                    ]);

    for (yy = [4.0, 24.5])
        translate([0, yy + rf_guide_len, 0])
            rotate([90, 0, 0])
                linear_extrude(height=rf_guide_len)
                    polygon(points=[
                        [right_inner_x, floor_t],
                        [rf_guide_right_outer_x, floor_t],
                        [right_inner_x+rf_guide_top_flat, rf_guide_top_z],
                        [right_inner_x, rf_guide_top_z]
                    ]);
}

module lid_lock_wall_bracket() {
    difference() {
        translate([lock_shelf_x0,
                   lock_y-lock_shelf_y/2,
                   floor_t-eps])
            cube([lock_shelf_x1-lock_shelf_x0,
                  lock_shelf_y,
                  lock_top_z-floor_t+eps]);

        translate([lock_x, lock_y, floor_t - eps])
            cylinder(d=lock_screw_clear_d,
                     h=lock_top_z - floor_t + 2*eps);

        translate([lock_x,
                   lock_y,
                   lock_top_z - lock_nut_trap_depth])
            cylinder(d=lock_nut_trap_corner_d,
                     h=lock_nut_trap_depth + eps,
                     $fn=6);
    }
}

module body() {
    union() {
        body_shell();
        xiao_guides();
        rf_guides_and_pegs();
        lid_lock_wall_bracket();
    }
}

// Sliding lid

module lid() {
    panel_x = wall + slide_clearance;
    nose_run = 0.70;
    nose_inset = 0.90;
    rail_x = panel_x + nose_run;
    end_bar_x = outer_x - end_bar_t;
    rail_l = end_bar_x - rail_x;
    panel_y = wall + slide_clearance;
    panel_w = outer_y - 2 * panel_y;
    rail_outer_y = wall - rail_depth + slide_clearance + 0.10;
    rail_bottom_z = lid_t + rail_drop;

    difference() {
      union() {
        hull() {
            translate([panel_x, panel_y + nose_inset, 0])
                cube([0.12, panel_w - 2 * nose_inset, lid_t]);
            translate([rail_x - 0.12, panel_y, 0])
                cube([0.12, panel_w, lid_t]);
        }
        translate([rail_x, panel_y, 0])
            cube([rail_l, panel_w, lid_t]);

        hull() {
            translate([rail_x, panel_y, lid_t - eps])
                cube([rail_l, rail_t, 0.12 + eps]);
            translate([rail_x, rail_outer_y, rail_bottom_z - 0.12])
                cube([rail_l, rail_t, 0.12]);
        }

        hull() {
            translate([rail_x,
                       outer_y - panel_y - rail_t,
                       lid_t - eps])
                cube([rail_l, rail_t, 0.12 + eps]);
            translate([rail_x,
                       outer_y - rail_outer_y - rail_t,
                       rail_bottom_z - 0.12])
                cube([rail_l, rail_t, 0.12]);
        }

        intersection() {
            translate([end_bar_x, rail_outer_y, 0])
                cube([end_bar_t,
                      outer_y - 2 * rail_outer_y,
                      lid_t + rail_drop]);
            rounded_prism([outer_x, outer_y, lid_t + rail_drop], outer_r);
        }
      }

      union() {
          translate([lock_x, outer_y - lock_y, -eps])
              cylinder(d=lock_screw_clear_d, h=lid_t + 2*eps);

          translate([lock_x, outer_y - lock_y, -eps])
              cylinder(d=lock_head_recess_d,
                       h=lock_head_recess_depth + eps);
          translate([lock_x, outer_y - lock_y, -eps])
              cylinder(d1=lock_head_entry_d, d2=lock_head_recess_d,
                       h=0.30 + eps);
      }

      translate([logo_cx, logo_cy, -eps])
          linear_extrude(height=logo_recess_depth + eps)
              mirror([0,1,0]) openshock_icon_2d(logo_size);

      translate([end_bar_x - eps,
                 outer_y - lock_y - lock_shelf_y/2 - lock_endbar_notch_clear,
                 lid_t])
          cube([outer_x - lock_endbar_outer_skin - end_bar_x + 2*eps,
                lock_shelf_y + 2*lock_endbar_notch_clear,
                rail_drop + eps]);
    }
}

// OpenShock icon

function arc_band_points(ro, ri, a0, a1, n) = concat(
    [for (i=[0:n])
        [ro*cos(a0+(a1-a0)*i/n), ro*sin(a0+(a1-a0)*i/n)]],
    [for (i=[n:-1:0])
        [ri*cos(a0+(a1-a0)*i/n), ri*sin(a0+(a1-a0)*i/n)]]
);

module logo_arc(ro, ri, a0, a1) {
    polygon(arc_band_points(ro, ri, a0, a1, logo_arc_segments));
}

module openshock_icon_2d(size=28) {
    s = size/28;
    scale([s,s]) union() {
        logo_arc(14.0, 12.15, 48, 222);
        logo_arc(14.0, 12.15, 252, 360);

        for (p=[[-9.65,-9.35],[-8.65,-10.15],[-7.55,-10.85]])
            translate(p) rotate(-42) square([0.52,2.15],center=true);

        polygon(points=[
            [ 2.02,  9.65], [ 0.31,  1.22], [ 5.45,  1.22],
            [-2.04, -9.67], [-0.33, -1.24], [-5.47, -1.24]
        ]);
    }
}

// Preview and part selection

module preview_components() {
    xiao_z = xiao_support_z;
    rf_z = rf_support_z;
    antenna_z = floor_t - antenna_seat_depth;

    color([0.15, 0.55, 0.65, 0.82])
        translate([xiao_x, xiao_y, xiao_z])
            cube([xiao_x_size, xiao_y_size, xiao_pcb_t]);
    color([0.10, 0.25, 0.45, 0.38])
        translate([xiao_x + 1.5, xiao_y + 4.0, xiao_z + xiao_pcb_t])
            cube([xiao_x_size - 3.0,
                  xiao_y_size - 6.0,
                  xiao_total_h - xiao_pcb_t]);

    color([0.70, 0.72, 0.75, 0.95])
        translate([usb_center_x - usb_step_w/2,
                   xiao_y - 1.53,
                   xiao_z + 0.26])
            cube([usb_step_w, 7.30, usb_step_h]);

    color([0.10, 0.50, 0.30, 0.82])
        translate([rf_x, rf_y, rf_z])
            cube([rf_x_size, rf_y_size, rf_pcb_t]);
    color([0.05, 0.25, 0.12, 0.35])
        translate([rf_x + 3.0, rf_y + 3.0, rf_z + rf_pcb_t])
            cube([rf_x_size - 6.0,
                  rf_y_size - 7.0,
                  rf_total_h - rf_pcb_t]);

    color([0.12, 0.12, 0.12, 0.90])
        translate([rf_header_x, rf_y + rf_y_size - 2.6, rf_z + 0.2])
            cube([rf_header_w, 3.0, 3.2]);
    color([0.20, 0.20, 0.20, 0.72])
        translate([dupont_x, dupont_y + 0.2, rf_z + 0.15])
            cube([dupont_w, 14.0, dupont_h]);

    color([0.04, 0.04, 0.04, 0.90])
        translate([antenna_x, antenna_y, antenna_z])
            cube([antenna_x_size, antenna_y_size, antenna_t]);
}

module assembly() {
    color([0.20, 0.48, 0.72, 0.78]) body();
    color([0.92, 0.42, 0.18, 0.72])
        translate([0, outer_y, body_h])
            rotate([180, 0, 0]) lid();
    if (show_components) preview_components();
}

module exploded() {
    color([0.20, 0.48, 0.72, 0.78]) body();
    color([0.92, 0.42, 0.18, 0.78])
        translate([10, outer_y, body_h + 13])
            rotate([180, 0, 0]) lid();
    if (show_components) preview_components();
}

module rail_test() {
    test_x = 12.0;
    test_l = 18.0;

    translate([-test_x, 0, 0])
        intersection() {
            body();
            translate([test_x, -eps, -eps])
                cube([test_l, outer_y + 2*eps, body_h + 2*eps]);
        }

    translate([-test_x + test_l + 8.0, 0, 0])
        intersection() {
            lid();
            translate([test_x, -eps, -eps])
                cube([test_l, outer_y + 2*eps, lid_t + rail_drop + 2*eps]);
        }
}

if (part == "body")
    body();
else if (part == "lid")
    lid();
else if (part == "exploded")
    exploded();
else if (part == "rail_test")
    rail_test();
else if (part == "assembly")
    assembly();
