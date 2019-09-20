#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
# Implementations
#
InstallGlobalFunction( BlissGraphCanonicalLabeling,
function( n, outneigh, colours, isdirected )
	if not IsPosInt(n) then
		Error( "BI: <1> must be a positive integer.");
	fi;
	if not (IsList(outneigh) and Length(outneigh)=n and ForAll(outneigh, x->IsList(x) and ForAll(x,y->IsPosInt(y) and (y<=n)))) then
		Error( "BI: <2> must be a list of lists of integers between 1 and <1>.");
	fi;
	if not (IsList(colours) and Length(colours)=n and ForAll(colours,IsInt)) then
		colours := 0;
	fi;
	if not IsBool(isdirected) then
		Error( "BI: <3> must be true or false.");
	fi;
	return BLISS_GRAPH_CANONICAL_LABELING( n, outneigh, colours, isdirected );
end );

InstallGlobalFunction( BlissBipartiteCanonicalLabeling,
function( n, m, outneigh, ucolours, lcolours )
	if not (IsPosInt(n) and IsPosInt(m)) then
		Error( "BI: <1> and <2> must be a positive integer.");
	fi;
	if not (IsList(outneigh) and Length(outneigh)=m and ForAll(outneigh, x->IsList(x) and ForAll(x,y->IsPosInt(y) and (y<=n)))) then
		Error( "BI: <3> must be a list of lists of integers between 1 and <1>.");
	fi;
	if not (IsList(ucolours) and Length(ucolours)=n and ForAll(ucolours,IsInt)) then
		ucolours := 0;
	fi;
	if not (IsList(lcolours) and Length(lcolours)=m and ForAll(lcolours,IsInt)) then
		lcolours := 0;
	fi;
	return BLISS_BIPARTITE_CANONICAL_LABELING( n, m, outneigh, ucolours, lcolours ); 
end );


