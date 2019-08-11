/*
 * BlissInterface: Low level interface to the bliss graph automorphism tool
 */

#ifndef BLISSINTERFACE_SRC_BLISSINTERFACE_H_
#define BLISSINTERFACE_SRC_BLISSINTERFACE_H_

// GAP headers
#include "src/compiled.h" // for Obj, Int

#include "bliss-0.73/graph.hh" // for bliss_digraphs_release, . . .

// Obj FuncIS_ANTISYMMETRIC_DIGRAPH(Obj self, Obj digraph);
Obj FuncTestCommand(Obj self);
Obj FuncTestCommandWithParams(Obj self, Obj param, Obj param2);
Obj FuncUseBliss(Obj self, Obj mat, Obj m, Obj n);

#endif // BLISSINTERFACE_SRC_BLISSINTERFACE_H_
