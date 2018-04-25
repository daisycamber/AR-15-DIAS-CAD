// This is a 1:1 scale UNTESTED model of a DIAS (drop in auto sear) for an AR-15 pistol/rifle to M16 automatic
// Note: This part is very illegal to manufacture without specific liscencing and IS UNTESTED. I have NOT printed or attempted to use this part, it is a rough draft, and the measurements may very well be off such that the part is entirley nonfunctional or simply dangerous to use. Fitting and modifications will likely be required. Use at your own risk.
// Also, feel free to optimize this code and add pull requests. Once again, this is a rough draft.

module sear_housing(){
    module housing(){
        translate([0,0,.160]){
            cube(size=[.39,.080,0.620-.16],center=false);
        }
        translate([0,0.335,.160]){
            cube(size=[.39,.062,0.620-.16],center=false);
        }
        translate([0.39,0.415/2,.3]){
        rotate([0,90,0]){
            cylinder($fn=1000,h=0.170,r=.156/2,center=false);
            }
        }
        translate([.39,0,0]){
            cube(size=[.03+.125,.397,.6200-.230],center=false);
        }

        CubePoints = [
          [  .0,  .415-0.018,  0 ],  //0
          [ .125,  .415-0.018,  0 ],  //1
          [ .125,  .415,  0 ],  //2
          [  0,  .397,  0 ],  //3
          [  0,  .415-0.018,  .620 ],  //4
          [ .125,  .415-0.018,  .620 ],  //5
          [ .125,  .415,  .620 ],  //6
          [  0,  .397,  .620 ]]; //7
          
        CubeFaces = [
          [0,1,2,3],  // bottom
          [4,5,1,0],  // front
          [7,6,5,4],  // top
          [5,6,2,1],  // right
          [6,7,3,2],  // back
          [7,4,0,3]]; // left
          
        translate([0.39+.03,0,0]){
            polyhedron( CubePoints, CubeFaces );
        }
        translate([.39+.03,0,0]){
            cube(size=[.125,.415-0.018,.150],center=false);
        }
        translate([.39+0.03+.125,0,0]){
            cube(size=[.695,.415,.150],center=false);
        }
        translate([.39+0.03+.125,0,.15]){
            cube(size=[.03+.125,.415,.620-.15-.230],center=false);
        }
        translate([.39,0,.15]){
            cube(size=[.06+.250,.080,.620-.15],center=false);
        }
        translate([.39,0.415-0.062-0.018,.15]){
            cube(size=[.06+.250,.062,.620-.15],center=false);
        }
        translate([.39+0.03+.125,0.415-0.018,.15]){
            cube(size=[.03+.125,.018,.620-.15],center=false);
        }
        
        translate([1.240-0.085,0,.15]){
            cube(size=[.085,.415,.620-.15],center=false);
        }
    }
    // Cut holes
    difference(){
        housing();
        translate([0.39,0.415/2,.3]){
        rotate([0,90,0]){
            cylinder($fn=1000,h=0.170,r=.156/2,center=false);
        }
    }
    translate([0.39+.03,0.080,.620-.230]){
        //cube(size=[.2,.255,.230],center=false);
    }
    translate([0.39,0.415/2,.3]){
    rotate([0,90,0]){
        cylinder($fn=1000,h=0.170,r=.156/2,center=false);
        }
    }
    translate([0.39,0.080,.620-.230]){
        //cube(size=[.2,.255,.230],center=false);
    }
    translate([0.21,0,.50]){
        rotate([-90,0,0]){
        cylinder($fn=1000,h=0.415,r=0.093/2,center=false);
        }
    }
    translate([0.21,0,.50]){
        rotate([-90,0,0]){
        cylinder($fn=1000,h=0.415,r=0.093/2,center=false);
        }
    }
    translate([0.39+.03+.125,0.080,.620-.230]){
        //cube(size=[.2,.255,.230],center=false);
        }
    }
}

module sear(){ // Build sear
    
    module sear_main(){ // Main part of sear (no holes)
        translate([0,0,0]){
    cube(size=[.225,.125,0.245],center=false);
    }
        translate([.225,0,0]){
    cube(size=[.723-.225,.200,0.245],center=false);
    }
        translate([.225,.125,0]){
    cube(size=[.120,.620-.125,0.245],center=false);       
    }
        translate([.225+.120,.175,0]){
    cube(size=[.128,.175,0.245],center=false);       
    }
    }
    difference(){ // Cut holes
    sear_main();
        translate([0.375,0.180,0]){
        cylinder($fn=1000,h=0.245,r=.100/2,center=false);
        }
        
        translate([.7230-.146,.200,.245/2]){
        rotate([90,0,0]){
        cylinder($fn=1000,h=0.140,r=0.156/2,center=false);
        }
    }   
    }
}

module sear_pin() { // Build pin for sear
    cylinder($fn=1000,h=0.245 + 0.080+0.062,r=.100/2,center=false);
}

// Render and seperate parts
translate([0,0,0]){ sear_housing(); }
translate([1.5,0,0]){ sear(); }
translate([2.5,0,0]){ sear_pin(); }