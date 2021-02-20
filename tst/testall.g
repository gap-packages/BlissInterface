#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
# This file runs package tests. It is also referenced in the package
# metadata in PackageInfo.g.
#
LoadPackage( "BlissInterface" );

dir := DirectoriesPackageLibrary( "BlissInterface", "tst" );
if GAPInfo.BytesPerVariable=8 then 
  toexclude := [ "blissinterface_32bit.tst", "nautyinterface_32bit.tst" ]; 
else
  toexclude := [ "blissinterface_64bit.tst", "nautyinterface_64bit.tst" ];
fi;

TestDirectory( dir,
  rec(
    exitGAP := true,
    testOptions := rec(compareFunction := "uptowhitespace"),
    exclude := toexclude
  )
);

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
