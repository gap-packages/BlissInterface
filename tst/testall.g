#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "BlissInterface" );

dir := DirectoriesPackageLibrary( "BlissInterface", "tst" );
if GAPInfo.BytesPerVariable=8 then 
  toexclude := [ "blissinterface_32bit.tst" ]; 
else
  toexclude := [ "blissinterface_64bit.tst" ];
fi;

TestDirectory( dir,
  rec(
    exitGAP := true,
    testOptions := rec(compareFunction := "uptowhitespace"),
    exclude := toexclude
  )
);

# dir := DirectoriesPackageLibrary( "BlissInterface", "tst" );
# optrec := rec(
#   exitGAP := true,
#   testOptions := rec(compareFunction := "uptowhitespace")
# );

# if GAPInfo.BytesPerVariable=4 then 
#   Test( Filename(dir,"blissinterface_32bit.tst"), rec(compareFunction := "uptowhitespace") );
# else
#   Test( Filename(dir,"blissinterface_64bit.tst"), rec(compareFunction := "uptowhitespace") );
# fi;

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
