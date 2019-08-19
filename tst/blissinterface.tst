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
gap> SizeScreen([72]);
[ 72, 40 ]
gap> LoadPackage( "BlissInterface", false );
true
gap> 
gap> mat:=[
>     BlistList([1..7],[1,2,4]),
>     BlistList([1..7],[2,3,5]),
>     BlistList([1..7],[3,4,6]),
>     BlistList([1..7],[4,5,7]),
>     BlistList([1..7],[5,6,1]),
>     BlistList([1..7],[6,7,2]),
>     BlistList([1..7],[7,1,3])
> ];
[ [ true, true, false, true, false, false, false ], 
  [ false, true, true, false, true, false, false ], 
  [ false, false, true, true, false, true, false ], 
  [ false, false, false, true, true, false, true ], 
  [ true, false, false, false, true, true, false ], 
  [ false, true, false, false, false, true, true ], 
  [ true, false, true, false, false, false, true ] ]
gap> 
gap> bl:=UseBliss( mat, 7, 7);
[ [ (3,4)(5,7)(10,12)(13,14), (3,5)(4,7)(8,11)(10,12), 
      (2,3)(4,6)(9,11)(12,13), (1,2)(4,7)(8,12)(10,11), 
      (1,8,5,13,3,10,2,9)(4,14)(6,11,7,12) ], 
  (1,14)(2,10,4,7,6,9,13)(3,8,11,12) ]
gap> Print(StructureDescription(Group(bl[1])),"\n");
PSL(3,2) : C2
gap> STOP_TEST( "blissinterface.tst", 10000 );
## The first argument of STOP_TEST should be the name of the test file.
## The number is a proportionality factor that is used to output a 
## "GAPstone" speed ranking after the file has been completely processed.
## For the files provided with the distribution this scaling is roughly 
## equalized to yield the same numbers as produced by the test file 
## tst/combinat.tst. For package tests, you may leave it unchnaged. 

#############################################################################
##
#E
