#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
# Implementations
#
InstallGlobalFunction( NautyGraphCanonicalLabeling,
function( n, outneigh, colours, isdirected )
	local vertices,stops;
	if not IsPosInt(n) then
		Error( "BI: <1> must be a positive integer.");
	fi;
	if not (IsList(outneigh) and Length(outneigh)=n and ForAll(outneigh, x->IsList(x) and ForAll(x,y->IsPosInt(y) and (y<=n)))) then
		Error( "BI: <2> must be a list of lists of integers between 1 and <1>.");
	fi;
	if not (IsList(colours) and Length(colours)=n and ForAll(colours,IsInt)) then
		vertices := 0;
		stops := 0;
	else 
		stops:=ShallowCopy(colours);
		vertices:=[1..n];
		StableSortParallel(stops,vertices);
		stops:=List([1..n],
			function(i) if i=n or stops[i]<>stops[i+1] then return 0; else return 1; fi; end
		);
	fi;
	if not IsBool(isdirected) then
		Error( "BI: <3> must be true or false.");
	fi;
	return NAUTY_GRAPH_CANONICAL_LABELING( n, outneigh, vertices, stops, isdirected );
end );

# upper vertices [1..n], lower vertices n+[1..m]
InstallGlobalFunction( NautyBipartiteCanonicalLabeling,
function( n, m, outneigh, ucolours, lcolours, arg... )
	local isdirected, vertices,stops;;
	if Length(arg)>0 and IsBool(arg[1]) then
		isdirected := arg[1];
	else
		isdirected := true;
	fi;
	if not (IsPosInt(n) and IsPosInt(m)) then
		Error( "BI: <1> and <2> must be a positive integer.");
	fi;
	if not (IsList(outneigh) and Length(outneigh)=m and ForAll(outneigh, x->IsList(x) and ForAll(x,y->IsPosInt(y) and (y<=n)))) then
		Error( "BI: <3> must be a list of lists of integers between 1 and <1>.");
	fi;
	if not (IsList(ucolours) and Length(ucolours)=n and ForAll(ucolours,IsInt)) then
		ucolours := ListWithIdenticalEntries(n,0);
	fi;
	if not (IsList(lcolours) and Length(lcolours)=m and ForAll(lcolours,IsInt)) then
		lcolours := ListWithIdenticalEntries(m,0);
	fi;

	stops:=Concatenation(ucolours, lcolours);
	vertices:=[1..n+m];
	StableSortParallel(stops,vertices);
	stops:=List([1..n+m],
		function(i) if i=n+m or stops[i]<>stops[i+1] then return 0; else return 1; fi; end
	);

	return NAUTY_GRAPH_CANONICAL_LABELING( 
		n+m, 
		Concatenation(ListWithIdenticalEntries(n,[]),outneigh), 
		vertices,
		stops, 
		isdirected
	); 
end );


