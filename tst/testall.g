#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "BlissInterface" );

# TestDirectory(DirectoriesPackageLibrary( "BlissInterface", "tst" ),
#   rec(
#     exitGAP := true,
#     testOptions := rec(compareFunction := "uptowhitespace")
#     )
#   );

dir := DirectoriesPackageLibrary( "BlissInterface", "tst" );
optrec := rec(
  exitGAP := true,
  testOptions := rec(compareFunction := "uptowhitespace")
);

if GAPInfo.BytesPerVariable=4 then 
  Test( Filename(dir,"blissinterface_32bit.tst"), optrec );
else
  Test( Filename(dir,"blissinterface_64bit.tst"), optrec );
fi;

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
