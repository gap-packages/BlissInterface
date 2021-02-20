#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
# Reading the declaration part of the package.
#
_PATH_SO:=Filename(DirectoriesPackagePrograms("BlissInterface"), "BlissInterface.so");
if _PATH_SO <> fail then
    LoadDynamicModule(_PATH_SO);
fi;
Unbind(_PATH_SO);

ReadPackage( "BlissInterface", "gap/BlissInterface.gd");
ReadPackage( "BlissInterface", "gap/NautyInterface.gd");
