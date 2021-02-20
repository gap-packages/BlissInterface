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
		vertices:=[1..Length(colours)];
		StableSortParallel(stops,vertices);
		stops:=List([1..Length(stops)],
			function(i) if i=Length(stops) or stops[i]<>stops[i+1] then return 0; else return 1; fi; end
		);
	fi;
	if not IsBool(isdirected) then
		Error( "BI: <3> must be true or false.");
	fi;
	return NAUTY_GRAPH_CANONICAL_LABELING( n, outneigh, vertices, stops, isdirected );
end );

