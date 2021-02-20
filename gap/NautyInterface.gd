#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
#! @Section Functionality
#!
#! This section will describe the function of <Package>BlissInterface</Package>, 
#! and its nonchecking counterpart.

#! @Description
#!   The coloured graph <C>G</C> has vertices <C>[1..n]</C>. 
#!   If <A>isdirected</A> is <C>true</C> the <C>G</C> is directed. 
#!   The edges of <C>G</C> are given by <A>outneigh</A>, which is a list 
#!   <C>[N_1,...,N_n]</C>, such that <C>N_i</C> is the list of (out)neighbors 
#!   of the vertex <C>i</C>. Duplicate edges between vertices and loops are ignored.
#!   <P />If <A>colours</A> is a list of length <C>n</C> then its elements are used to
#!   define a vertex colouring of <C>G</C>, otherwise all vertices have colour <C>0</C>.
#!   <P />This function has a nonchecking version <C>BLISS_GRAPH_CANONICAL_LABELING</C>
#!   with the same parameters. Clearly, the nonchecking version is slightly faster
#!   but it must be used with extreme care. Bad parameters may result in unpredictable
#!   behaviour. 
#! @Arguments n, outneigh, colours, isdirected
#! @Returns
#!   The triple <C>[gens,cl,hash]</C> as GAP object, where <C>gens</C> is a list
#!   of generators for the group of colour preserving automorphisms of 
#!   the graph <C>G</C>, <C>cl</C> is a canonical labeling of <C>G</C>, 
#!   and <C>hash</C> is an integer valued hash of the permuted graph.
DeclareGlobalFunction( "NautyGraphCanonicalLabeling" );

