LoadPackage("blissinterface");

petersen:=[[2,5,6],[1,3,7],[2,4,8],[3,5,9],[1,4,10],
    [1,8,9],[2,9,10],[3,6,10],[4,6,7],[5,7,8]];
NAUTY_GRAPH_CANONICAL_LABELING(10, petersen, 0, 0, false);
StructureDescription(Group(last[1]));

dir_edges:=[
    [1,2],[2,3],[3,1],[4,5],[5,6],[6,4],[7,8],[8,9],[9,7],
    [1,4],[4,7],[7,1],[2,5],[5,8],[8,2],[3,6],[6,9],[9,3]
];
dg:=List([1..9],i->Filtered([1..9],j->[i,j] in dir_edges));
NAUTY_GRAPH_CANONICAL_LABELING(9, dg, 0, 0, true);
StructureDescription(Group(last[1]));

NAUTY_GRAPH_CANONICAL_LABELING(9, dg, 0, 0, false);
StructureDescription(Group(last[1]));

fano:=Set([[1,2,4],[2,3,5],[3,4,6],[4,5,7], [5,6,1],[6,7,2],[7,1,3]],Set);
fano2:=Concatenation([[],[],[],[],[],[],[]],fano);
NAUTY_GRAPH_CANONICAL_LABELING(14, fano2, 0, 0, true);
StructureDescription(Group(last[1]));

fanocolors:=[1,0,0,1,0,1,1,2,2,2,2,2,2,2];
pp:=SortingPerm(fanocolors);
vertices:=Permuted([1..Length(fanocolors)],pp);
colours:=Permuted(fanocolors,pp);
colours:=List([1..Length(colours)],function(i) if i=Length(colours) or colours[i]<>colours[i+1] then return 0; else return 1; fi; end);
NAUTY_GRAPH_CANONICAL_LABELING(14, fano2, vertices, colours, true);
StructureDescription(Group(last[1]));
Orbits(Group(last2[1]));

