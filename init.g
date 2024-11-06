#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
# Reading the declaration part of the package.
#
if not LoadKernelExtension("BlissInterface") then
  Error("failed to load the BlissInterface package kernel extension");
fi;

ReadPackage( "BlissInterface", "gap/BlissInterface.gd");
