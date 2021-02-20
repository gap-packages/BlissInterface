LoadPackage("blissinterface");

petersen:=[[2,5,6],[1,3,7],[2,4,8],[3,5,9],[1,4,10],
    [1,8,9],[2,9,10],[3,6,10],[4,6,7],[5,7,8]];
NautyGraphCanonicalLabeling(10, petersen, 0, false);
StructureDescription(Group(last[1]));

dir_edges:=[
    [1,2],[2,3],[3,1],[4,5],[5,6],[6,4],[7,8],[8,9],[9,7],
    [1,4],[4,7],[7,1],[2,5],[5,8],[8,2],[3,6],[6,9],[9,3]
];
dg:=List([1..9],i->Filtered([1..9],j->[i,j] in dir_edges));
NautyGraphCanonicalLabeling(9, dg, 0, true);
StructureDescription(Group(last[1]));

NautyGraphCanonicalLabeling(9, dg, 0, false);
StructureDescription(Group(last[1]));

fano:=Set([[1,2,4],[2,3,5],[3,4,6],[4,5,7], [5,6,1],[6,7,2],[7,1,3]],Set);
fano2:=Concatenation([[],[],[],[],[],[],[]],fano);
NautyGraphCanonicalLabeling(14, fano2, 0, true);
StructureDescription(Group(last[1]));

fanocolors:=[1,0,0,1,0,1,1,2,2,2,2,2,2,2];
NautyGraphCanonicalLabeling(14, fano2, fanocolors, true);
StructureDescription(Group(last[1]));

paley:=p->List([0..p-1],x->Filtered([1..p],y->Jacobi(p,x-y)=1));
NautyGraphCanonicalLabeling(41,paley(41),0,true);
