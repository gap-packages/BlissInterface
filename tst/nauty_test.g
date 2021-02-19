LoadPackage("blissinterface");

petersen:=[[2,5,6],[1,3,7],[2,4,8],[3,5,9],[1,4,10],
    [1,8,9],[2,9,10],[3,6,10],[4,6,7],[5,7,8]];
NAUTY_GRAPH_CANONICAL_LABELING(10, petersen, 0, false);