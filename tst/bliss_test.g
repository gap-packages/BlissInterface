SizeScreen([72]);
LoadPackage( "BlissInterface", false );

mat:=[
    BlistList([1..7],[1,2,4]),
    BlistList([1..7],[2,3,5]),
    BlistList([1..7],[3,4,6]),
    BlistList([1..7],[4,5,7]),
    BlistList([1..7],[5,6,1]),
    BlistList([1..7],[6,7,2]),
    BlistList([1..7],[7,1,3])
];

UseBliss( mat, 7, 7);
