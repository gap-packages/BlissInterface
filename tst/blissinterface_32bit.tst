#############################################################################
##
#A  bliss.tst             BlissInterface package                Gábor P. Nagy
##
##  To create a test file, place GAP prompts, input and output exactly as
##  they must appear in the GAP session. Do not remove lines containing 
##  START_TEST and STOP_TEST statements.
##
##  The first line starts the test. START_TEST reinitializes the caches and 
##  the global random number generator, in order to be independent of the 
##  reading order of several test files. Furthermore, the assertion level 
##  is set to 2 by START_TEST and set back to the previous value in the 
##  subsequent STOP_TEST call.
##
##  The argument of STOP_TEST may be an arbitrary identifier string.
## 
gap> START_TEST("BlissInterface package: blissinterface.tst");
gap> SizeScreen([72,23]);
[ 72, 23 ]
gap> 
gap> ExtendRootDirectories([Concatenation(GAPInfo.UserHome,"/MyGAP/")]);
gap> LoadPackage( "BlissInterface", false );
true
gap> 
gap> ###################################
gap> fano:=Set([[1,2,4],[2,3,5],[3,4,6],[4,5,7],
>     [5,6,1],[6,7,2],[7,1,3]],Set);
[ [ 1, 2, 4 ], [ 1, 3, 7 ], [ 1, 5, 6 ], [ 2, 3, 5 ], [ 2, 6, 7 ], 
  [ 3, 4, 6 ], [ 4, 5, 7 ] ]
gap> 
gap> bl1:=BlissBipartiteCanonicalLabeling(7, 7, fano, 0, 0);
[ [ (3,5)(6,7)(9,10)(13,14), (3,6)(5,7)(9,10)(11,12), 
      (2,3)(4,7)(8,9)(12,13), (1,2)(5,7)(9,11)(10,12) ], 
  (1,7,3,4,5,2,6)(8,14)(9,13)(10,12), -300483201 ]
gap> g1:=Group(bl1[1]);
Group([ (3,5)(6,7)(9,10)(13,14), (3,6)(5,7)(9,10)(11,12), (2,3)(4,7)
  (8,9)(12,13), (1,2)(5,7)(9,11)(10,12) ])
gap> Print(StructureDescription(g1),"\n");
PSL(3,2)
gap> OrbitLength(g1,fano,OnSetsSets);
1
gap> 
gap> bl1c:=BlissBipartiteCanonicalLabeling(7, 7, fano, 
>     [0,0,1,0,1,1,1], 0);
[ [ (3,5)(6,7)(9,10)(13,14), (3,7)(5,6)(11,12)(13,14), 
      (2,4)(5,6)(11,13)(12,14), (1,2)(5,7)(9,11)(10,12) ], 
  (1,3,14,5,12,4)(6,11,7,13)(8,10), 368073940 ]
gap> g1c:=Group(bl1c[1]);
Group([ (3,5)(6,7)(9,10)(13,14), (3,7)(5,6)(11,12)(13,14), (2,4)(5,6)
  (11,13)(12,14), (1,2)(5,7)(9,11)(10,12) ])
gap> Print(StructureDescription(g1c),"\n");
S4
gap> Orbits(g1c,[1..14]);
[ [ 1, 4, 2 ], [ 3, 6, 5, 7 ], [ 8 ], [ 9, 13, 10, 11, 14, 12 ] ]
gap> 
gap> bl1cc:=BlissBipartiteCanonicalLabeling(7, 7, fano, 0, 
>     [0,1,1,1,1,1,1]);
[ [ (3,5)(6,7)(9,10)(13,14), (3,7)(5,6)(11,12)(13,14), 
      (2,4)(5,6)(11,13)(12,14), (1,2)(5,7)(9,11)(10,12) ], 
  (1,7,3,4,5,2,6)(9,14)(10,13)(11,12), 256682661 ]
gap> g1cc:=Group(bl1cc[1]);
Group([ (3,5)(6,7)(9,10)(13,14), (3,7)(5,6)(11,12)(13,14), (2,4)(5,6)
  (11,13)(12,14), (1,2)(5,7)(9,11)(10,12) ])
gap> Print(StructureDescription(g1cc),"\n");
S4
gap> Orbits(g1cc,[1..14]);
[ [ 1, 4, 2 ], [ 3, 6, 5, 7 ], [ 8 ], [ 9, 13, 10, 11, 14, 12 ] ]
gap> 
gap> petersen:=[[2,5,6],[1,3,7],[2,4,8],[3,5,9],[1,4,10],
>     [1,8,9],[2,9,10],[3,6,10],[4,6,7],[5,7,8]];
[ [ 2, 5, 6 ], [ 1, 3, 7 ], [ 2, 4, 8 ], [ 3, 5, 9 ], [ 1, 4, 10 ], 
  [ 1, 8, 9 ], [ 2, 9, 10 ], [ 3, 6, 10 ], [ 4, 6, 7 ], [ 5, 7, 8 ] ]
gap> bl2:=BlissGraphCanonicalLabeling(10, petersen, false, false);
[ [ (4,8)(5,6)(9,10), (2,5,6)(3,4,9,7,10,8), (1,2,3,4,9,6)(5,7,8) ], 
  (1,10)(2,9)(3,6,8,4,5,7), 209617178 ]
gap> g2:=Group(bl2[1]);
Group([ (4,8)(5,6)(9,10), (2,5,6)(3,4,9,7,10,8), (1,2,3,4,9,6)(5,7,8) 
 ])
gap> Print(StructureDescription(g2),"\n");
S5
gap> 
gap> bl2c:=BlissGraphCanonicalLabeling(10, petersen, 
>     [1,1,1,1,1,2,2,2,2,2], false);
[ [ (2,5)(3,4)(7,10)(8,9), (1,2,3,4,5)(6,7,8,9,10) ], 
  (1,5,3,2,4)(6,10,7)(8,9), 293067930 ]
gap> g2c:=Group(bl2c[1]);
Group([ (2,5)(3,4)(7,10)(8,9), (1,2,3,4,5)(6,7,8,9,10) ])
gap> Print(StructureDescription(g2c),"\n");
D10
gap> 
gap> dir_edges:=[
>     [1,2],[2,3],[3,1],[4,5],[5,6],[6,4],[7,8],[8,9],[9,7],
>     [1,4],[4,7],[7,1],[2,5],[5,8],[8,2],[3,6],[6,9],[9,3]
> ];
[ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ], [ 4, 5 ], [ 5, 6 ], [ 6, 4 ], 
  [ 7, 8 ], [ 8, 9 ], [ 9, 7 ], [ 1, 4 ], [ 4, 7 ], [ 7, 1 ], 
  [ 2, 5 ], [ 5, 8 ], [ 8, 2 ], [ 3, 6 ], [ 6, 9 ], [ 9, 3 ] ]
gap> dg:=List([1..9],i->Filtered([1..9],j->[i,j] in dir_edges));
[ [ 2, 4 ], [ 3, 5 ], [ 1, 6 ], [ 5, 7 ], [ 6, 8 ], [ 4, 9 ], 
  [ 1, 8 ], [ 2, 9 ], [ 3, 7 ] ]
gap> bl3:=BlissGraphCanonicalLabeling(9, dg, false, true);
[ [ (2,4)(3,7)(6,8), (1,2,3)(4,5,6)(7,8,9) ], (1,9)(2,7,5,4,8)(3,6), 
  -177864343 ]
gap> g3:=Group(bl3[1]);
Group([ (2,4)(3,7)(6,8), (1,2,3)(4,5,6)(7,8,9) ])
gap> Print(StructureDescription(g3),"\n");
C3 x S3
gap> 
gap> path:=[[2],[3],[]];
[ [ 2 ], [ 3 ], [  ] ]
gap> BlissGraphCanonicalLabeling(3, path, false, true);
[ [  ], (1,2,3), -270956424 ]
gap> BlissGraphCanonicalLabeling(3, path, false, false);
[ [ (1,3) ], (1,2,3), -184501359 ]
gap> ###################################
gap> 
gap> STOP_TEST( "blissinterface.tst", 10000 );

