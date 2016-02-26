module walls(w=13,l=24,h=11){
    cube([w,l,h]);
}

module roof(w=13,l=24,h=10){
    polyhedron(
        points=[ 
            [0,0,0],[w,0,0],[w,l,0],[0,l,0],//base
            [w/2,0,h], [w/2,l,h]  //top
        ],                             
        faces=[ 
            [0,1,2],[0,2,3],//base
            [4,1,0],//front
            [3,2,5],//back
            [0,3,5],[0,5,4],//left
            [1,5,2],[1,4,5]//right
        ]
    );
}

module house(w=13,l=24,h=11,rh=7){
    union(){
        walls(w,l,h);
        translate([0,0,h])
            roof(w,l,rh);
    }
}