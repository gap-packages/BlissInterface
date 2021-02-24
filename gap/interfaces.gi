#
# BlissInterface: Low level interface to the bliss graph automorphism tool
#
# Implementations
#

InstallValue( OPTIONS@, rec( solver:= "bliss", colouring_format:="plain" ) );

InstallGlobalFunction( GraphCanonicalLabeling@,
function( n, outneigh, colours, isdirected )
    local vertices, stops;
	if not IsPosInt(n) then
		Error( "BI: <1> must be a positive integer.");
	fi;
	if not (IsList(outneigh) and Length(outneigh)=n and ForAll(outneigh, x->IsList(x) and ForAll(x,y->IsPosInt(y) and (y<=n)))) then
		Error( "BI: <2> must be a list of lists of integers between 1 and <1>.");
	fi;
	if not IsBool(isdirected) then
		Error( "BI: <3> must be true or false.");
	fi;
    # invalid colouring formats are replaced by 0 or [0,0]
    if OPTIONS@.colouring_format = "nauty" then
        if not(IsList(colours) and Length(colours)=2) then 
            colours := [0,0];
		elif not(Length(colours[1])=n and ForAll(colours[1],IsPosInt)) then
			colours[1]:=0;
		elif not(Length(colours[2])=n and ForAll(colours[2],IsPosInt)) then
			colours[2]:=0;
        fi;
    else 
        if not (IsList(colours) and Length(colours)=n and ForAll(colours,IsInt)) then
            colours := 0;
        fi;
    fi;
    # if solver and colouring format mismatch
    if OPTIONS@.colouring_format = "plain" and OPTIONS@.solver = "nauty" then
        if colours = 0 then
            colours := [0,0];
        else
            stops:=ShallowCopy(colours);
            vertices:=[1..n];
            StableSortParallel(stops,vertices);
            stops:=List([1..n],
                function(i) if i=n or stops[i]<>stops[i+1] then return 0; else return 1; fi; end
		    ); 
            colours := [vertices, stops];
        fi;
    fi;
    if OPTIONS@.colouring_format = "nauty" and OPTIONS@.solver = "bliss" then
        if colours = [0,0] then
            colours := 0;
        else
			colours[2] := Concatenation([0],1-colours[2]);
			colours[2] := List([1..n],i->Sum(colours[2]{[1..i]}));
			StableSortParallel(colours[1],colours[2]);
            colours := colours[2];
        fi;
    fi;
	return GraphCanonicalLabelingNC@( n, outneigh, colours, isdirected );
end );

InstallGlobalFunction( GraphCanonicalLabelingNC@,
function( n, outneigh, colours, isdirected )
    if OPTIONS@.solver = "bliss" then
    	return BLISS_GRAPH_CANONICAL_LABELING( n, outneigh, colours, isdirected );
    elif OPTIONS@.solver = "nauty" then
        return NAUTY_GRAPH_CANONICAL_LABELING( n, outneigh, colours[1], colours[2], isdirected );
	else
		Error("unknown solver");
    fi;
end );

# upper vertices [1..n], lower vertcies n+[1..m]
InstallGlobalFunction( BipartiteCanonicalLabeling@,
function( n, m, outneigh, ucolours, lcolours, arg... )
	local isdirected;
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

    return GraphCanonicalLabelingNC@(
		n+m, 
		Concatenation(ListWithIdenticalEntries(n,[]),outneigh), 
		Concatenation(ucolours,lcolours), 
		isdirected
	); 
end );

InstallGlobalFunction( BipartiteCanonicalLabelingNC@,
function( n, m, outneigh, ucolours, lcolours, isdirected )
	return GraphCanonicalLabelingNC@( 
		n+m, 
		Concatenation(ListWithIdenticalEntries(n,[]),outneigh), 
		Concatenation(ucolours,lcolours), 
		isdirected
	); 
end );



