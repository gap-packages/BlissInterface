#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
#! @Chapter Usage of the package
#!
#! @Section Introduction
#! 
#! @Section Installation
#! 
#! @Section Interface to bliss and nauty
#! 
#! This section will describe the funtions of <Package>BlissInterface</Package>, 
#! and their nonchecking counterparts. The nonchecking versions are slightly 
#! faster but it must be used with extreme care. Bad parameters may result 
#! in unpredictable behaviour. 
#!
#! @Description
#!   The coloured graph <C>G</C> has vertices <C>[1..n]</C>. 
#!   If <A>isdirected</A> is <C>true</C> then <C>G</C> is directed. 
#!   The edges of <C>G</C> are given by <A>outneigh</A>, which is a list 
#!   <C>[N_1,...,N_n]</C>, such that <C>N_i</C> is the list of (out)neighbors 
#!   of the vertex <C>i</C>. Duplicate edges between vertices and loops are ignored.
#!   <P />If <A>colours</A> is a list of length <C>n</C> then its elements are used to
#!   define a vertex colouring of <C>G</C>, otherwise all vertices have colour <C>0</C>.
#!   <P />This function has a nonchecking version <C>BLISS_GRAPH_CANONICAL_LABELING</C>
#!   with the same parameters. 
#! @Arguments n, outneigh, colours, isdirected
#! @Returns
#!   The triple <C>[gens,cl,hash]</C> as GAP object, where <C>gens</C> is a list
#!   of generators for the group of colour preserving automorphisms of 
#!   the graph <C>G</C>, <C>cl</C> is a canonical labeling of <C>G</C>, 
#!   and <C>hash</C> is an integer valued hash of the permuted graph.
DeclareGlobalFunction( "BlissGraphCanonicalLabeling" );

#! @Arguments n, m, outneigh, ucolours, lcolours[, isdirected]
#! @Returns
#!   The triple <C>[gens,cl,hash]</C> as GAP object, where <C>gens</C> is a list
#!   of generators for <C>Aut(G)</C>, <C>cl</C> is a canonical labeling of
#!   <C>G</C>, and <C>hash</C> is an integer valued hash of the permuted graph.
#! @Description
#!   The coloured, bipartite graph <C>G</C> has vertices 
#!   <C>[1..n+m]</C>. Upper vertices are <C>[1..n]</C>, lower vertices are
#!   <C>[n+1..n+m]</C>. If <A>isdirected</A> is <C>true</C> (default), then <C>G</C> is
#!   directed and the edges point bottom up.
#!   The edges of <C>G</C> are given by <A>outneigh</A>, which is a list 
#!   <C>[N_1,...,N_m]</C>, such that <C>N_i</C> is the list of outneighbors 
#!   of the lower vertex <C>n+i</C>. Duplicate edges between vertices and 
#!   loops are ignored.
#!   <P />If <A>ucolours</A> is a list of length <C>n</C> then its elements 
#!   are used to define a colouring of the upper vertices, otherwise all 
#!   upper vertices have colour <C>0</C>. Similarly, if <A>lcolours</A> 
#!   is a list of length <C>m</C> then it defines a colouring of the lower 
#!   vertices.
DeclareGlobalFunction( "BlissBipartiteCanonicalLabeling" );

#! @Section Examples