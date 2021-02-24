LogTo("/tmp/clif_test.tst");
START_TEST("CLIF package: clif.tst");
SizeScreen([72,23]);

ExtendRootDirectories([Concatenation(GAPInfo.UserHome,"/MyGAP/")]);
LoadPackage( "CLIF", false );

###################################
fano:=Set([[1,2,4],[2,3,5],[3,4,6],[4,5,7],
    [5,6,1],[6,7,2],[7,1,3]],Set);

bl1:=BipartiteCanonicalLabeling@BlissInterface(7, 7, fano, 0, 0);
g1:=Group(bl1[1]);
Print(StructureDescription(g1),"\n");
OrbitLength(g1,fano,OnSetsSets);

bl1c:=BipartiteCanonicalLabeling@BlissInterface(7, 7, fano, 
    [0,0,1,0,1,1,1], 0);
g1c:=Group(bl1c[1]);
Print(StructureDescription(g1c),"\n");
Orbits(g1c,[1..14]);

bl1cc:=BipartiteCanonicalLabeling@BlissInterface(7, 7, fano, 0, 
    [0,1,1,1,1,1,1]);
g1cc:=Group(bl1cc[1]);
Print(StructureDescription(g1cc),"\n");
Orbits(g1cc,[1..14]);

petersen:=[[2,5,6],[1,3,7],[2,4,8],[3,5,9],[1,4,10],
    [1,8,9],[2,9,10],[3,6,10],[4,6,7],[5,7,8]];
bl2:=GraphCanonicalLabeling@BlissInterface(10, petersen, false, false);
g2:=Group(bl2[1]);
Print(StructureDescription(g2),"\n");

bl2c:=GraphCanonicalLabeling@BlissInterface(10, petersen, 
    [1,1,1,1,1,2,2,2,2,2], false);
g2c:=Group(bl2c[1]);
Print(StructureDescription(g2c),"\n");

dir_edges:=[
    [1,2],[2,3],[3,1],[4,5],[5,6],[6,4],[7,8],[8,9],[9,7],
    [1,4],[4,7],[7,1],[2,5],[5,8],[8,2],[3,6],[6,9],[9,3]
];
dg:=List([1..9],i->Filtered([1..9],j->[i,j] in dir_edges));
bl3:=GraphCanonicalLabeling@BlissInterface(9, dg, false, true);
g3:=Group(bl3[1]);
Print(StructureDescription(g3),"\n");
bl4:=GraphCanonicalLabeling@BlissInterface(9, dg, false, false);
g4:=Group(bl4[1]);
Print(StructureDescription(g4),"\n");

path:=[[2],[3],[]];
BlissGraphCanonicalLabeling@BlissInterface(3, path, false, true);
BlissGraphCanonicalLabeling@BlissInterface(3, path, false, false);
###################################

STOP_TEST( "clif.tst", 10000 );
LogTo();

StringTime(Runtime());
