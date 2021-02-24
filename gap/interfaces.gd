#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
#! @Chapter Usage of the package
#!
#! @Section Introduction
#! 
#! @Section Installation
#! 
#! @Section Solvers
#! 
#! In the present version of the package, we have access to the following solvers:
#! <List>
#! <Item><URL Text="bliss: A Tool for Computing 
#! Automorphism Groups and Canonical Labelings of 
#! Graphs">http://www.tcs.hut.fi/Software/bliss/</URL>, 
#! written by Tommi Junttila and Petteri Kaski <Cite Key="Bliss:2007" />. </Item>
#! <Item><URL Text="nauty: Graph Canonical Labeling and Automorphism Group
#! Computation">https://pallini.di.uniroma1.it/</URL>, written by Brendan McKay and Adolfo Piperno
#! and Adolfo Piperno <Cite Key="Nauty:2014" />.</Item>
#! </List>
#! 
#! @Description
#!    The solver can be set using the variable <C>OPTIONS&#64;</C>. This is a 
#!   record with two fields: <C>OPTIONS&#64;.solver</C> can take the values 
#!   <C>"bliss"</C> and <C>"nauty"</C>. Default is <C>"bliss"</C>.
#!   <P />The field <C>OPTIONS&#64;.colouring_format</C>
#!   specifies the format of the vertex colouring of the graph in question. 
#!   The value <C>"plain"</C> means the colouring is given by a list of integers
#!   of length $n$, such that the $i$th value is the colour of vertex $i$. When 
#!   <C>OPTIONS&#64;.colouring_format = "nauty"</C>, then the vertex colouring
#!   is given by a pair of list of length $n$, using nauty's format. 
#!   Default is <C>"plain"</C>.
DeclareGlobalVariable("OPTIONS@");
#! 
#! 
#! @Section Interfaces
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
#! @Arguments n, outneigh, colours, isdirected
#! @Returns
#!   The triple <C>[gens,cl,hash]</C> as GAP object, where <C>gens</C> is a list
#!   of generators for the group of colour preserving automorphisms of 
#!   the graph <C>G</C>, <C>cl</C> is a canonical labeling of <C>G</C>, 
#!   and <C>hash</C> is an integer valued hash of the permuted graph.
DeclareGlobalFunction( "GraphCanonicalLabeling@" );

#! @Description
#!   <C>GraphCanonicalLabelingNC</C> is the operation that is called by the function
#!   <C>GraphCanonicalLabeling</C>, using the same arguments. Results are 
#!   unpredictable if the parameters are not well-formed. 
#! @Arguments n, outneigh, colours, isdirected
DeclareGlobalFunction( "GraphCanonicalLabelingNC@" );

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
DeclareGlobalFunction( "BipartiteCanonicalLabeling@" );

#! @Description
#!   <C>BipartiteCanonicalLabelingNC</C> is the operation that is called 
#!   by the function <C>BipartiteCanonicalLabeling</C>, using the 
#!   same arguments. Results are unpredictable if the parameters are not 
#!   well-formed. 
#! @Arguments n, outneigh, colours, isdirected
DeclareGlobalFunction( "BipartiteCanonicalLabelingNC@" );

#! @Section Examples