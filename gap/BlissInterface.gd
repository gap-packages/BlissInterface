#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
#! @Chapter Usage of the package
#!
#! @Section Introduction
#!
#! The &GAP; package <Package>BlissInterface</Package> provides a low level 
#! interface to the software <URL Text="bliss: A Tool for Computing 
#! Automorphism Groups and Canonical Labelings of 
#! Graphs">http://www.tcs.hut.fi/Software/bliss/</URL>, 
#! written by Tommi Junttila and Petteri Kaski <Cite Key="Bliss:2007" />. 
#! 
#! The only interest of this package is the computation of the group 
#! of colour preserving automorphisms of coloured graphs. The graphs 
#! can be directed or undirected, bipartite or not. Duplicate edges 
#! between vertices are ignored but try to avoid introducing them in 
#! the first place as they are not ignored immediately but will 
#! consume memory and computation resources for a while.
#! 
#! For more specialized algorithms and methods of the theory of graphs,
#! we recommend the packages <Package>Digraphs</Package> <Cite 
#! Key="Digraphs0.15.2" /> and <Package>GRAPE</Package> <Cite 
#! Key="GRAPE4.8.2" />. 
#! To compute graph automorphisms see also the software  <URL Text="nauty">
#! http://users.cecs.anu.edu.au/~bdm/nauty/</URL> by Brendan McKay and Adolfo 
#! Piperno <Cite Key="Nauty:2014" />.
#!
#! @Section Installation
#! 
#! - Download the package from <URL>https://github.com/gap-packages/BlissInterface</URL>.
#! - Unzip/untar the file, this should create a directory called <F>BlissInterface*</F>.
#! - Locate the <F>pkg</F> directory of your &GAP; directory, which contains the 
#!   directories <F>lib</F>, <F>doc</F> and so on. Move the directory 
#!   <F>BlissInterface*</F> into the <F>pkg</F> directory.
#! - Alternatively, you can use your <F>pkg</F> directory. Make sure it is in your 
#!   &GAP; root path.
#! - It is necessary to compile the &BlissInterface; package. Inside the 
#!   <F>pkg/BlissInterface*</F> directory, type
#!   <Listing>
#!   <![CDATA[./configure
#!   make]]></Listing>
#! - Start &GAP; in the usual way (i.e. type <C>gap</C> at the command line).
#! - Type <C>LoadPackage("blissinterface");</C>
#! - For questions, remarks and issues please use the 
#!   <URL Text="issue tracker">https://github.com/gap-packages/BlissInterface/issues</URL>.
#! 
#! @Section Functionality
#!
#! This section will describe the two functions of <Package>BlissInterface</Package>, 
#! and their nonchecking counterparts.

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
#!   The pair <C>[gens,cl]</C> as GAP object, where <C>gens</C> is a list
#!   of generators for for the group of colour preserving automorphisms of 
#!   the graph <C>G</C>, and <C>cl</C> is a canonical labeling of <C>G</C>.
DeclareGlobalFunction( "BlissGraphCanonicalLabeling" );

#! @Arguments n, m, outneigh, ucolours, lcolours
#! @Returns
#!   The pair <C>[gens,cl]</C> as GAP object, where <C>gens</C> is a list
#!   of generators for <C>Aut(G)</C> and <C>cl</C> is a canonical labeling of
#!   <C>G</C>.
#! @Description
#!   The coloured, directed, bipartite graph <C>G</C> has vertices 
#!   <C>[1..n+m]</C>. Upper vertices are <C>[1..n]</C>, lower vertices are
#!   <C>[n+1..n+m]</C>. Edges point bottom up.
#!   The edges of <C>G</C> are given by <A>outneigh</A>, which is a list 
#!   <C>[N_1,...,N_n]</C>, such that <C>N_i</C> is the list of outneighbors 
#!   of the lower vertex <C>n+i</C>. Duplicate edges between vertices and 
#!   loops are ignored.
#!   <P />If <A>ucolours</A> is a list of length <C>n</C> then its elements 
#!   are used to define a colouring of the upper vertices, otherwise all 
#!   upper vertices have colour <C>0</C>. Similarly, if <A>lcolours</A> 
#!   is a list of length <C>m</C> then it defines a colouring of the lower 
#!   vertices.
#!   <P />This function has a nonchecking version <C>BLISS_BIPARTITE_CANONICAL_LABELING</C>
#!   with the same parameters. Clearly, the nonchecking version is slightly 
#!   faster but it must be used with extreme care. Bad parameters may result 
#!   in unpredictable behaviour. 
#! @Returns
#!   The pair <C>[gens,cl]</C> as GAP object, where <C>gens</C> is a list
#!   of generators for for the group of colour preserving automorphisms of 
#!   the directed bipartite graph <C>G</C>, and <C>cl</C> is a canonical 
#!   labeling of <C>G</C>.
DeclareGlobalFunction( "BlissBipartiteCanonicalLabeling" );

#! @Section Examples
#! 
#! Using the point-line graph $\Gamma$ of the Fano plane $PG(2,2)$, we can compute its
#! collineation group $PSL(3,2)$. By colouring the vertices of $\Gamma$, we get
#! stabilizers of points and/or line.
#! 
#! @BeginExampleSession
#! gap> LoadPackage( "BlissInterface", false );
#! true
#! gap> 
#! gap> fano:=Set([[1,2,4],[2,3,5],[3,4,6],[4,5,7],
#! >     [5,6,1],[6,7,2],[7,1,3]],Set);
#! [ [ 1, 2, 4 ], [ 1, 3, 7 ], [ 1, 5, 6 ], [ 2, 3, 5 ], [ 2, 6, 7 ], 
#!   [ 3, 4, 6 ], [ 4, 5, 7 ] ]
#! gap> 
#! gap> bl1:=BlissBipartiteCanonicalLabeling(7, 7, fano, 0, 0);
#! [ [ (3,5)(6,7)(9,10)(13,14), (3,6)(5,7)(9,10)(11,12), 
#!       (2,3)(4,7)(8,9)(12,13), (1,2)(5,7)(9,11)(10,12) ], 
#!   (1,7,3,4,5,2,6)(8,14)(9,13)(10,12) ]
#! gap> g1:=Group(bl1[1]);
#! Group([ (3,5)(6,7)(9,10)(13,14), (3,6)(5,7)(9,10)(11,12), (2,3)(4,7)
#! (8,9)(12,13), (1,2)(5,7)(9,11)(10,12) ])
#! gap> Print(StructureDescription(g1),"\n");
#! PSL(3,2)
#! gap> OrbitLength(g1,fano,OnSetsSets);
#! 1
#! gap> 
#! gap> bl1c:=BlissBipartiteCanonicalLabeling(7, 7, fano, 
#! >     [0,0,1,0,1,1,1], 0);
#! [ [ (3,5)(6,7)(9,10)(13,14), (3,7)(5,6)(11,12)(13,14), 
#!       (2,4)(5,6)(11,13)(12,14), (1,2)(5,7)(9,11)(10,12) ], 
#!   (1,3,14,5,12,4)(6,11,7,13)(8,10) ]
#! gap> g1c:=Group(bl1c[1]);
#! Group([ (3,5)(6,7)(9,10)(13,14), (3,7)(5,6)(11,12)(13,14), (2,4)(5,6)
#! (11,13)(12,14), (1,2)(5,7)(9,11)(10,12) ])
#! gap> Print(StructureDescription(g1c),"\n");
#! S4
#! gap> Orbits(g1c,[1..14]);
#! [ [ 1, 4, 2 ], [ 3, 6, 5, 7 ], [ 8 ], [ 9, 13, 10, 11, 14, 12 ] ]
#! gap> 
#! gap> bl1cc:=BlissBipartiteCanonicalLabeling(7, 7, fano, 0, 
#! >     [0,1,1,1,1,1,1]);
#! [ [ (3,5)(6,7)(9,10)(13,14), (3,7)(5,6)(11,12)(13,14), 
#!       (2,4)(5,6)(11,13)(12,14), (1,2)(5,7)(9,11)(10,12) ], 
#!   (1,7,3,4,5,2,6)(9,14)(10,13)(11,12) ]
#! gap> g1cc:=Group(bl1cc[1]);
#! Group([ (3,5)(6,7)(9,10)(13,14), (3,7)(5,6)(11,12)(13,14), (2,4)(5,6)
#! (11,13)(12,14), (1,2)(5,7)(9,11)(10,12) ])
#! gap> Print(StructureDescription(g1cc),"\n");
#! S4
#! gap> Orbits(g1cc,[1..14]);
#! [ [ 1, 4, 2 ], [ 3, 6, 5, 7 ], [ 8 ], [ 9, 13, 10, 11, 14, 12 ] ]
#! @EndExampleSession
#! 
#! The automorphism group of the Petersen graphy is isomorphic to $S_5$. 
#! The automorphisms preserving two disjoint 5-cycles form a dihedral group 
#! of order 10.
#! 
#! @BeginExampleSession 
#! gap> petersen:=[[2,5,6],[1,3,7],[2,4,8],[3,5,9],[1,4,10],
#! >     [1,8,9],[2,9,10],[3,6,10],[4,6,7],[5,7,8]];
#! [ [ 2, 5, 6 ], [ 1, 3, 7 ], [ 2, 4, 8 ], [ 3, 5, 9 ], [ 1, 4, 10 ], 
#!   [ 1, 8, 9 ], [ 2, 9, 10 ], [ 3, 6, 10 ], [ 4, 6, 7 ], [ 5, 7, 8 ] ]
#! gap> bl2:=BlissGraphCanonicalLabeling(10, petersen, false, false);
#! [ [ (4,8)(5,6)(9,10), (2,5,6)(3,4,9,7,10,8), (1,2,3,4,9,6)(5,7,8) ], 
#!   (1,10)(2,9)(3,6,8,4,5,7) ]
#! gap> g2:=Group(bl2[1]);
#! Group([ (4,8)(5,6)(9,10), (2,5,6)(3,4,9,7,10,8), (1,2,3,4,9,6)
#! (5,7,8) ])
#! gap> Print(StructureDescription(g2),"\n");
#! S5
#! gap> 
#! gap> bl2c:=BlissGraphCanonicalLabeling(10, petersen, 
#! >     [1,1,1,1,1,2,2,2,2,2], false);
#! [ [ (2,5)(3,4)(7,10)(8,9), (1,2,3,4,5)(6,7,8,9,10) ], 
#!   (1,5,3,2,4)(6,10,7)(8,9) ]
#! gap> g2c:=Group(bl2c[1]);
#! Group([ (2,5)(3,4)(7,10)(8,9), (1,2,3,4,5)(6,7,8,9,10) ])
#! gap> Print(StructureDescription(g2c),"\n");
#! D10
#! @EndExampleSession 
#! 
#! Let $\Gamma$ be the direct product of two oriented cycles of size 3.
#! Then $Aut(\Gamma)$ is isomorphic to $(C_3 \times C_3).C_2$.
#! 
#! @BeginExampleSession 
#! gap> dir_edges:=[
#! >     [1,2],[2,3],[3,1],[4,5],[5,6],[6,4],[7,8],[8,9],[9,7],
#! >     [1,4],[4,7],[7,1],[2,5],[5,8],[8,2],[3,6],[6,9],[9,3]
#! > ];
#! [ [ 1, 2 ], [ 2, 3 ], [ 3, 1 ], [ 4, 5 ], [ 5, 6 ], [ 6, 4 ], 
#!   [ 7, 8 ], [ 8, 9 ], [ 9, 7 ], [ 1, 4 ], [ 4, 7 ], [ 7, 1 ], 
#!   [ 2, 5 ], [ 5, 8 ], [ 8, 2 ], [ 3, 6 ], [ 6, 9 ], [ 9, 3 ] ]
#! gap> dg:=List([1..9],i->Filtered([1..9],j->[i,j] in dir_edges));
#! [ [ 2, 4 ], [ 3, 5 ], [ 1, 6 ], [ 5, 7 ], [ 6, 8 ], [ 4, 9 ], 
#!   [ 1, 8 ], [ 2, 9 ], [ 3, 7 ] ]
#! gap> bl3:=BlissGraphCanonicalLabeling(9, dg, false, true);
#! [ [ (2,4)(3,7)(6,8), (1,2,3)(4,5,6)(7,8,9) ], (1,9)(2,7,5,4,8)(3,6) ]
#! gap> g3:=Group(bl3[1]);
#! Group([ (2,4)(3,7)(6,8), (1,2,3)(4,5,6)(7,8,9) ])
#! gap> Print(StructureDescription(g3),"\n");
#! C3 x S3
#! @EndExampleSession 
#! 
#! The last example shows that the same set of edges may define both
#! directed and undirected graphs.
#! 
#! @BeginExampleSession 
#! gap> path:=[[2],[3],[]];
#! [ [ 2 ], [ 3 ], [  ] ]
#! gap> BlissGraphCanonicalLabeling(3, path, false, true);
#! [ [  ], (1,2,3) ]
#! gap> BlissGraphCanonicalLabeling(3, path, false, false);
#! [ [ (1,3) ], (1,2,3) ]
#! @EndExampleSession