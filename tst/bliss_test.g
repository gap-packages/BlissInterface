SizeScreen([72]);
ExtendRootDirectories([Concatenation(GAPInfo.UserHome,"/MyGAP/")]);
LoadPackage( "BlissInterface", false );

fano:=Set([[1,2,4],[2,3,5],[3,4,6],[4,5,7],
    [5,6,1],[6,7,2],[7,1,3]],Set);

bl1:=BlissBipartiteCanonicalLabeling(7, 7, fano);
g1:=Group(bl1[1]);
Print(StructureDescription(g1),"\n");
OrbitLength(g1,fano,OnSetsSets);

petersen:=[[2,5,6],[1,3,7],[2,4,8],[3,5,9],[1,4,10],
    [1,8,9],[2,9,10],[3,6,10],[4,6,7],[5,7,8]];
bl2:=BlissUndirectedCanonicalLabeling(10, petersen);
g2:=Group(bl2[1]);
Print(StructureDescription(g2),"\n");

dir_edges:=[
    [1,2],[2,3],[3,1],[4,5],[5,6],[6,4],[7,8],[8,9],[9,7],
    [1,4],[4,7],[7,1],[2,5],[5,8],[8,2],[3,6],[6,9],[9,3]
];
dg:=List([1..9],i->Filtered([1..9],j->[i,j] in dir_edges));
bl3:=BlissDirectedCanonicalLabeling(9, dg);
g3:=Group(bl3[1]);
Print(StructureDescription(g3),"\n");
